defmodule LagoApiClient.Analytics do
  @moduledoc """
  Provides API endpoints related to analytics
  """

  @default_client LagoApiClient.Client

  @doc """
  List gross revenue

  Gross revenue is the sum of monthly `finalized` invoice payments and fees paid in advance that are not invoiceable. This total is calculated after deducting taxes and discounts.

  ## Options

    * `currency`: Currency of revenue analytics. Format must be ISO 4217.
    * `external_customer_id`: The customer external unique identifier (provided by your own application). Use it to filter revenue analytics at the customer level.
    * `months`: Show data only for given number of months.

  """
  @spec find_all_gross_revenues(keyword) ::
          {:ok, LagoApiClient.GrossRevenues.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_gross_revenues(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:currency, :external_customer_id, :months])

    client.request(%{
      args: [],
      call: {LagoApiClient.Analytics, :find_all_gross_revenues},
      url: "/analytics/gross_revenue",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.GrossRevenues, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List of finalized invoices

  Represents a monthly aggregation, detailing both the total count and the cumulative amount of invoices that have been marked as `finalized`. This report sorts invoices categorically based on their `payment_status`.

  ## Options

    * `currency`: The currency of revenue analytics. Format must be ISO 4217.
    * `months`: Show data only for given number of months.

  """
  @spec find_all_invoice_collections(keyword) ::
          {:ok, LagoApiClient.InvoiceCollections.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_invoice_collections(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:currency, :months])

    client.request(%{
      args: [],
      call: {LagoApiClient.Analytics, :find_all_invoice_collections},
      url: "/analytics/invoice_collection",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.InvoiceCollections, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List usage revenue

  Reports a monthly analysis focused on the revenue generated from all usage-based fees. It exclusively accounts for revenue that has been formally invoiced. Importantly, this report does not include revenue related to the usage in the current billing period, limiting its scope to previously invoiced amounts.

  ## Options

    * `currency`: The currency of invoiced usage analytics. Format must be ISO 4217.
    * `months`: Show data only for given number of months.

  """
  @spec find_all_invoiced_usages(keyword) ::
          {:ok, LagoApiClient.InvoicedUsages.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_invoiced_usages(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:currency, :months])

    client.request(%{
      args: [],
      call: {LagoApiClient.Analytics, :find_all_invoiced_usages},
      url: "/analytics/invoiced_usage",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.InvoicedUsages, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List MRR

  This endpoint is used to list MRR.

  ## Options

    * `currency`: Quantifies the revenue generated from `subscription` fees on a monthly basis. This figure is calculated post-application of applicable taxes and deduction of any applicable discounts. The method of calculation varies based on the subscription billing cycle:
      
      - Revenue from `monthly` subscription invoices is included in the MRR for the month in which the invoice is issued.
      - Revenue from `quarterly` subscription invoices is distributed evenly over three months. This distribution applies to fees paid in advance (allocated to the next remaining months depending on calendar or anniversary billing) as well as to fees paid in arrears (allocated to the preceding months depending on calendar or anniversary billing).
      - Revenue from `yearly` subscription invoices is distributed evenly over twelve months. This allocation is applicable for fees paid in advance (spread over the next  remaining months depending on calendar or anniversary billing) and for fees paid in arrears (spread over the previous months depending on calendar or anniversary billing).
      - Revenue from `weekly` subscription invoices, the total revenue from all invoices issued within a month is summed up. This total is then divided by the number of invoices issued during that month, and the result is multiplied by 4.33, representing the average number of weeks in a month.
    * `months`: Show data only for given number of months.

  """
  @spec find_all_mrrs(keyword) ::
          {:ok, LagoApiClient.Mrrs.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_mrrs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:currency, :months])

    client.request(%{
      args: [],
      call: {LagoApiClient.Analytics, :find_all_mrrs},
      url: "/analytics/mrr",
      method: :get,
      query: query,
      response: [{200, {LagoApiClient.Mrrs, :t}}, {401, {LagoApiClient.ApiErrorUnauthorized, :t}}],
      opts: opts
    })
  end

  @doc """
  List overdue balance

  Overdue balance is the total amount associated with overdue invoices (invoices with pending or failed payments which are past their due dates).

  ## Options

    * `currency`: Currency of revenue analytics. Format must be ISO 4217.
    * `external_customer_id`: The customer external unique identifier (provided by your own application). Use it to filter revenue analytics at the customer level.
    * `months`: Show data only for given number of months.

  """
  @spec find_all_overdue_balances(keyword) ::
          {:ok, LagoApiClient.OverdueBalances.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_overdue_balances(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:currency, :external_customer_id, :months])

    client.request(%{
      args: [],
      call: {LagoApiClient.Analytics, :find_all_overdue_balances},
      url: "/analytics/overdue_balance",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.OverdueBalances, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end
end
