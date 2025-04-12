defmodule LagoClient.AddOns do
  @moduledoc """
  Provides API endpoints related to add ons
  """

  @default_client LagoClient.Client

  @doc """
  Create an add-on

  This endpoint is used to create an add-on that can be then attached to a one-off invoice.
  """
  @spec create_add_on(LagoClient.AddOnCreateInput.t(), keyword) ::
          {:ok, LagoClient.AddOn.t()} | {:error, LagoClient.Error.t()}
  def create_add_on(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.AddOns, :create_add_on},
      url: "/add_ons",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.AddOnCreateInput, :t}}],
      response: [
        {200, {LagoClient.AddOn, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an add-on

  This endpoint is used to delete an existing add-on.
  """
  @spec destroy_add_on(String.t(), keyword) ::
          {:ok, LagoClient.AddOn.t()} | {:error, LagoClient.Error.t()}
  def destroy_add_on(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.AddOns, :destroy_add_on},
      url: "/add_ons/#{code}",
      method: :delete,
      response: [
        {200, {LagoClient.AddOn, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve an add-on

  This endpoint is used to retrieve a specific add-on.
  """
  @spec find_add_on(String.t(), keyword) ::
          {:ok, LagoClient.AddOn.t()} | {:error, LagoClient.Error.t()}
  def find_add_on(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.AddOns, :find_add_on},
      url: "/add_ons/#{code}",
      method: :get,
      response: [
        {200, {LagoClient.AddOn, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all add-ons

  This endpoint is used to list all existing add-ons.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_add_ons(keyword) ::
          {:ok, LagoClient.AddOnsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_add_ons(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.AddOns, :find_all_add_ons},
      url: "/add_ons",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.AddOnsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an add-on

  This endpoint is used to update an existing add-on.
  """
  @spec update_add_on(String.t(), LagoClient.AddOnUpdateInput.t(), keyword) ::
          {:ok, LagoClient.AddOn.t()} | {:error, LagoClient.Error.t()}
  def update_add_on(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {LagoClient.AddOns, :update_add_on},
      url: "/add_ons/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.AddOnUpdateInput, :t}}],
      response: [
        {200, {LagoClient.AddOn, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
