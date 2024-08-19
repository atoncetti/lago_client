defmodule LagoApiClient.Taxes do
  @moduledoc """
  Provides API endpoints related to taxes
  """

  @default_client LagoApiClient.Client

  @doc """
  Create a tax

  This endpoint creates a new tax representing a customizable tax rate applicable to either the organization or a specific customer.
  """
  @spec create_tax(LagoApiClient.TaxCreateInput.t(), keyword) ::
          {:ok, LagoApiClient.Tax.t()} | {:error, LagoApiClient.Error.t()}
  def create_tax(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.Taxes, :create_tax},
      url: "/taxes",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.TaxCreateInput, :t}}],
      response: [
        {200, {LagoApiClient.Tax, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a tax

  This endpoint is used to delete a tax.
  """
  @spec destroy_tax(String.t(), keyword) ::
          {:ok, LagoApiClient.Tax.t()} | {:error, LagoApiClient.Error.t()}
  def destroy_tax(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoApiClient.Taxes, :destroy_tax},
      url: "/taxes/#{code}",
      method: :delete,
      response: [
        {200, {LagoApiClient.Tax, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all taxes

  This endpoint retrieves all existing taxes representing a customizable tax rate applicable to either the organization or a specific customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_taxes(keyword) ::
          {:ok, LagoApiClient.TaxesPaginated.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_taxes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoApiClient.Taxes, :find_all_taxes},
      url: "/taxes",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.TaxesPaginated, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a Tax

  This endpoint retrieves an existing tax representing a customizable tax rate applicable to either the organization or a specific customer. The tax is identified by its unique code.
  """
  @spec find_tax(String.t(), keyword) ::
          {:ok, LagoApiClient.Tax.t()} | {:error, LagoApiClient.Error.t()}
  def find_tax(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoApiClient.Taxes, :find_tax},
      url: "/taxes/#{code}",
      method: :get,
      response: [
        {200, {LagoApiClient.Tax, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a tax

  This endpoint updates an existing tax representing a customizable tax rate applicable to either the organization or a specific customer.
  """
  @spec update_tax(String.t(), LagoApiClient.TaxUpdateInput.t(), keyword) ::
          {:ok, LagoApiClient.Tax.t()} | {:error, LagoApiClient.Error.t()}
  def update_tax(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {LagoApiClient.Taxes, :update_tax},
      url: "/taxes/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoApiClient.TaxUpdateInput, :t}}],
      response: [
        {200, {LagoApiClient.Tax, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
