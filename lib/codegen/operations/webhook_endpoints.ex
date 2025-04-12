defmodule LagoClient.WebhookEndpoints do
  @moduledoc """
  Provides API endpoints related to webhook endpoints
  """

  @default_client LagoClient.Client

  @doc """
  Create a webhook_endpoint

  This endpoint is used to create a webhook endpoint.
  """
  @spec create_webhook_endpoint(LagoClient.WebhookEndpointCreateInput.t(), keyword) ::
          {:ok, LagoClient.WebhookEndpoint.t()} | {:error, LagoClient.Error.t()}
  def create_webhook_endpoint(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.WebhookEndpoints, :create_webhook_endpoint},
      url: "/webhook_endpoints",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.WebhookEndpointCreateInput, :t}}],
      response: [
        {200, {LagoClient.WebhookEndpoint, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a webhook endpoint

  This endpoint is used to delete an existing webhook endpoint.
  """
  @spec destroy_webhook_endpoint(String.t(), keyword) ::
          {:ok, LagoClient.WebhookEndpoint.t()} | {:error, LagoClient.Error.t()}
  def destroy_webhook_endpoint(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.WebhookEndpoints, :destroy_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      method: :delete,
      response: [
        {200, {LagoClient.WebhookEndpoint, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {405, {LagoClient.ApiErrorNotAllowed, :t}}
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
          {:ok, LagoClient.WebhookEndpointsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_webhook_endpoints(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.WebhookEndpoints, :find_all_webhook_endpoints},
      url: "/webhook_endpoints",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.WebhookEndpointsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a webhook endpoint

  This endpoint is used to retrieve an existing webhook endpoint.
  """
  @spec find_webhook_endpoint(String.t(), keyword) ::
          {:ok, LagoClient.WebhookEndpoint.t()} | {:error, LagoClient.Error.t()}
  def find_webhook_endpoint(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.WebhookEndpoints, :find_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoClient.WebhookEndpoint, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a webhook endpoint

  This endpoint is used to update an existing webhook endpoint.
  """
  @spec update_webhook_endpoint(String.t(), LagoClient.WebhookEndpointUpdateInput.t(), keyword) ::
          {:ok, LagoClient.WebhookEndpoint.t()} | {:error, LagoClient.Error.t()}
  def update_webhook_endpoint(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {LagoClient.WebhookEndpoints, :update_webhook_endpoint},
      url: "/webhook_endpoints/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.WebhookEndpointUpdateInput, :t}}],
      response: [
        {200, {LagoClient.WebhookEndpoint, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
