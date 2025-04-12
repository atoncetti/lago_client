defmodule LagoClient.Taxes do
  @moduledoc """
  Provides API endpoints related to taxes
  """

  @default_client LagoClient.Client

  @doc """
  Create a tax

  This endpoint creates a new tax representing a customizable tax rate applicable to either the organization or a specific customer.
  """
  @spec create_tax(LagoClient.TaxCreateInput.t(), keyword) ::
          {:ok, LagoClient.Tax.t()} | {:error, LagoClient.Error.t()}
  def create_tax(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Taxes, :create_tax},
      url: "/taxes",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.TaxCreateInput, :t}}],
      response: [
        {200, {LagoClient.Tax, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a tax

  This endpoint is used to delete a tax.
  """
  @spec destroy_tax(String.t(), keyword) ::
          {:ok, LagoClient.Tax.t()} | {:error, LagoClient.Error.t()}
  def destroy_tax(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.Taxes, :destroy_tax},
      url: "/taxes/#{code}",
      method: :delete,
      response: [
        {200, {LagoClient.Tax, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
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
          {:ok, LagoClient.TaxesPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_taxes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.Taxes, :find_all_taxes},
      url: "/taxes",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.TaxesPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a Tax

  This endpoint retrieves an existing tax representing a customizable tax rate applicable to either the organization or a specific customer. The tax is identified by its unique code.
  """
  @spec find_tax(String.t(), keyword) ::
          {:ok, LagoClient.Tax.t()} | {:error, LagoClient.Error.t()}
  def find_tax(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.Taxes, :find_tax},
      url: "/taxes/#{code}",
      method: :get,
      response: [
        {200, {LagoClient.Tax, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a tax

  This endpoint updates an existing tax representing a customizable tax rate applicable to either the organization or a specific customer.
  """
  @spec update_tax(String.t(), LagoClient.TaxUpdateInput.t(), keyword) ::
          {:ok, LagoClient.Tax.t()} | {:error, LagoClient.Error.t()}
  def update_tax(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {LagoClient.Taxes, :update_tax},
      url: "/taxes/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.TaxUpdateInput, :t}}],
      response: [
        {200, {LagoClient.Tax, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
