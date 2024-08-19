defmodule LagoApiClient.WebhookEndpoints do
  @moduledoc """
  Provides API endpoints related to webhook endpoints
  """

  @default_client LagoApiClient.Client

  @doc """
  Create a webhook_endpoint

  This endpoint is used to create a webhook endpoint.
  """
  @spec create_webhook_endpoint(LagoApiClient.WebhookEndpointCreateInput.t(), keyword) ::
          {:ok, LagoApiClient.WebhookEndpoint.t()} | {:error, LagoApiClient.Error.t()}
  def create_webhook_endpoint(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.WebhookEndpoints, :create_webhook_endpoint},
      url: "/webhook_endpoints",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.WebhookEndpointCreateInput, :t}}],
      response: [
        {200, {LagoApiClient.WebhookEndpoint, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a webhook endpoint

  This endpoint is used to delete an existing webhook endpoint.
  """
  @spec destroy_webhook_endpoint(String.t(), keyword) ::
          {:ok, LagoApiClient.WebhookEndpoint.t()} | {:error, LagoApiClient.Error.t()}
  def destroy_webhook_endpoint(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.WebhookEndpoints, :destroy_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      method: :delete,
      response: [
        {200, {LagoApiClient.WebhookEndpoint, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {405, {LagoApiClient.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all webhook endpoints

  This endpoint is used to list all webhook endpoints.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_webhook_endpoints(keyword) ::
          {:ok, LagoApiClient.WebhookEndpointsPaginated.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_webhook_endpoints(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoApiClient.WebhookEndpoints, :find_all_webhook_endpoints},
      url: "/webhook_endpoints",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.WebhookEndpointsPaginated, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a webhook endpoint

  This endpoint is used to retrieve an existing webhook endpoint.
  """
  @spec find_webhook_endpoint(String.t(), keyword) ::
          {:ok, LagoApiClient.WebhookEndpoint.t()} | {:error, LagoApiClient.Error.t()}
  def find_webhook_endpoint(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.WebhookEndpoints, :find_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoApiClient.WebhookEndpoint, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a webhook endpoint

  This endpoint is used to update an existing webhook endpoint.
  """
  @spec update_webhook_endpoint(String.t(), LagoApiClient.WebhookEndpointUpdateInput.t(), keyword) ::
          {:ok, LagoApiClient.WebhookEndpoint.t()} | {:error, LagoApiClient.Error.t()}
  def update_webhook_endpoint(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {LagoApiClient.WebhookEndpoints, :update_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoApiClient.WebhookEndpointUpdateInput, :t}}],
      response: [
        {200, {LagoApiClient.WebhookEndpoint, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
