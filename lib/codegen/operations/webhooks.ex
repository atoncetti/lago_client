defmodule LagoApiClient.Webhooks do
  @moduledoc """
  Provides API endpoint related to webhooks
  """

  @default_client LagoApiClient.Client

  @doc """
  Retrieve webhook public key

  This endpoint is used to retrieve the public key used to verify the webhooks signature
  """
  @spec fetch_public_key(keyword) :: {:ok, String.t()} | {:error, LagoApiClient.Error.t()}
  def fetch_public_key(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {LagoApiClient.Webhooks, :fetch_public_key},
      url: "/webhooks/public_key",
      method: :get,
      response: [{200, {:string, :generic}}, {401, {LagoApiClient.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end
end
