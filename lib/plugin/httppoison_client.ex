if Code.ensure_loaded?(HTTPoison) do
  defmodule LagoClient.Plugin.HTTPoisonClient do
    alias LagoClient.Error
    alias LagoClient.Operation

    @http_code_success 200..206
    @http_code_redirect [301, 302, 303, 307, 308]
    @http_code_server_error 500..511

    @spec request(Operation.t(), keyword) :: {:ok, Operation.t()} | {:error, Error.t()}
    def request(
          %Operation{
            request_body: body,
            request_headers: headers,
            request_method: method,
            request_params: params,
            request_server: server,
            request_url: url
          } = operation,
          _opts
        ) do
      url = Path.join(server, url)
      body = body || ""
      headers = modify_user_agent(headers)
      options = if params, do: [params: params], else: []

      case HTTPoison.request(method, url, body, headers, options) do
        {:ok, %HTTPoison.Response{} = response} ->
          process_response(operation, response)

        {:error, %HTTPoison.Error{} = error} ->
          message = "Error during HTTP request"
          step = {__MODULE__, :encode_body}

          {:error, Error.new(message: message, operation: operation, source: error, step: step)}
      end
    end

    @spec process_response(Operation.t(), HTTPoison.Response.t()) ::
            {:ok, Operation.t()} | {:error, Error.t()}
    defp process_response(operation, %HTTPoison.Response{status_code: code} = response)
         when code in @http_code_success do
      %HTTPoison.Response{body: body, headers: headers} = response

      operation = %Operation{
        operation
        | response_body: body,
          response_code: code,
          response_headers: headers
      }

      {:ok, operation}
    end

    defp process_response(operation, %HTTPoison.Response{status_code: code} = response)
         when code in @http_code_redirect do
      if location = get_redirect(response.headers) do
        server = URI.to_string(%URI{location | path: nil, query: nil, fragment: nil})
        url = location.path

        query =
          if location.query do
            URI.decode_query(location.query) |> Enum.to_list()
          end

        %Operation{
          operation
          | request_server: server,
            request_url: url,
            request_params: query
        }
        |> request([])
      else
        message = "Received redirect response with no Location header"
        step = {__MODULE__, :request}

        {:error,
         Error.new(
           code: code,
           message: message,
           operation: operation,
           source: response,
           step: step
         )}
      end
    end

    defp process_response(operation, %HTTPoison.Response{status_code: code} = response)
         when code in @http_code_server_error do
      message = "Received server error response (#{code})"
      step = {__MODULE__, :request}

      {:error,
       Error.new(
         code: code,
         message: message,
         operation: operation,
         source: response,
         step: step
       )}
    end

    defp process_response(operation, response) do
      %HTTPoison.Response{body: body, headers: headers, status_code: code} = response

      operation = %Operation{
        operation
        | response_body: body,
          response_code: code,
          response_headers: headers
      }

      {:ok, operation}
    end

    @spec get_redirect(HTTPoison.headers()) :: URI.t() | nil
    defp get_redirect([]), do: nil

    defp get_redirect([{header, value} | rest]) do
      if String.match?(header, ~r/^location$/i) do
        URI.parse(value)
      else
        get_redirect(rest)
      end
    end

    @spec modify_user_agent(HTTPoison.headers()) :: HTTPoison.headers()
    defp modify_user_agent(headers) do
      hackney_vsn = Application.spec(:hackney, :vsn)

      Enum.map(headers, fn {header, value} ->
        if String.match?(header, ~r/^user-agent$/) do
          {header, "#{value}; hackney #{hackney_vsn}"}
        else
          {header, value}
        end
      end)
    end
  end
end
