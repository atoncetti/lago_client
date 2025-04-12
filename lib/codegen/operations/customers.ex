defmodule LagoClient.Customers do
  @moduledoc """
  Provides API endpoints related to customers
  """

  @default_client LagoClient.Client

  @doc """
  Create a customer

  This endpoint creates a new customer.
  """
  @spec create_customer(LagoClient.CustomerCreateInput.t(), keyword) ::
          {:ok, LagoClient.Customer.t()} | {:error, LagoClient.Error.t()}
  def create_customer(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Customers, :create_customer},
      url: "/customers",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.CustomerCreateInput, :t}}],
      response: [
        {200, {LagoClient.Customer, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an applied coupon

  This endpoint is used to delete a specific coupon that has been applied to a customer.
  """
  @spec delete_applied_coupon(String.t(), String.t(), keyword) ::
          {:ok, LagoClient.AppliedCoupon.t()} | {:error, LagoClient.Error.t()}
  def delete_applied_coupon(external_customer_id, applied_coupon_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id, applied_coupon_id: applied_coupon_id],
      call: {LagoClient.Customers, :delete_applied_coupon},
      url: "/customers/#{external_customer_id}/applied_coupons/#{applied_coupon_id}",
      method: :delete,
      response: [
        {200, {LagoClient.AppliedCoupon, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a customer

  This endpoint deletes an existing customer.
  """
  @spec destroy_customer(String.t(), keyword) ::
          {:ok, LagoClient.Customer.t()} | {:error, LagoClient.Error.t()}
  def destroy_customer(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {LagoClient.Customers, :destroy_customer},
      url: "/customers/#{external_customer_id}",
      method: :delete,
      response: [
        {200, {LagoClient.Customer, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve customer past usage

  This endpoint enables the retrieval of the usage-based billing data for a customer within past periods.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_subscription_id`: The unique identifier of the subscription within your application.
    * `billable_metric_code`: Billable metric code filter to apply to the charge usage
    * `periods_count`: Number of past billing period to returns in the result

  """
  @spec find_all_customer_past_usage(String.t(), keyword) ::
          {:ok, LagoClient.CustomerPastUsage.t()} | {:error, LagoClient.Error.t()}
  def find_all_customer_past_usage(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :billable_metric_code,
        :external_subscription_id,
        :page,
        :per_page,
        :periods_count
      ])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {LagoClient.Customers, :find_all_customer_past_usage},
      url: "/customers/#{external_customer_id}/past_usage",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.CustomerPastUsage, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all customers

  This endpoint retrieves all existing customers.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `account_type`: Filter customers by account type.

  """
  @spec find_all_customers(keyword) ::
          {:ok, LagoClient.CustomersPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_customers(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:account_type, :page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.Customers, :find_all_customers},
      url: "/customers",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.CustomersPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a customer

  This endpoint retrieves an existing customer.
  """
  @spec find_customer(String.t(), keyword) ::
          {:ok, LagoClient.Customer.t()} | {:error, LagoClient.Error.t()}
  def find_customer(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {LagoClient.Customers, :find_customer},
      url: "/customers/#{external_customer_id}",
      method: :get,
      response: [
        {200, {LagoClient.Customer, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve customer current usage

  This endpoint enables the retrieval of the usage-based billing data for a customer within the current period.

  ## Options

    * `external_subscription_id`: The unique identifier of the subscription within your application.
    * `apply_taxes`: Optional flag to determine if taxes should be applied. Defaults to `true` if not provided or if null.
      

  """
  @spec find_customer_current_usage(String.t(), keyword) ::
          {:ok, LagoClient.CustomerUsage.t()} | {:error, LagoClient.Error.t()}
  def find_customer_current_usage(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:apply_taxes, :external_subscription_id])

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {LagoClient.Customers, :find_customer_current_usage},
      url: "/customers/#{external_customer_id}/current_usage",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.CustomerUsage, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate a Customer Payment Provider Checkout URL

  This endpoint regenerates the Payment Provider Checkout URL of a Customer.
  """
  @spec generate_customer_checkout_url(String.t(), keyword) ::
          {:ok, LagoClient.CustomerCheckoutUrl.t()} | {:error, LagoClient.Error.t()}
  def generate_customer_checkout_url(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {LagoClient.Customers, :generate_customer_checkout_url},
      url: "/customers/#{external_customer_id}/checkout_url",
      method: :post,
      response: [
        {200, {LagoClient.CustomerCheckoutUrl, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @type get_customer_portal_url_200_json_resp :: %{
          __info__: map,
          customer: LagoClient.CustomersCustomer.get_customer_portal_url_200_json_resp()
        }

  @doc """
  Get a customer portal URL

  Retrieves an embeddable link for displaying a customer portal.

  This endpoint allows you to fetch the URL that can be embedded to provide customers access to a dedicated portal
  """
  @spec get_customer_portal_url(String.t(), keyword) ::
          {:ok, map} | {:error, LagoClient.Error.t()}
  def get_customer_portal_url(external_customer_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id],
      call: {LagoClient.Customers, :get_customer_portal_url},
      url: "/customers/#{external_customer_id}/portal_url",
      method: :get,
      response: [
        {200, {LagoClient.Customers, :get_customer_portal_url_200_json_resp}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_customer_portal_url_200_json_resp) do
    [customer: {LagoClient.CustomersCustomer, :get_customer_portal_url_200_json_resp}]
  end
end
