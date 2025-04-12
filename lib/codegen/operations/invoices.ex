defmodule LagoClient.Invoices do
  @moduledoc """
  Provides API endpoints related to invoices
  """

  @default_client LagoClient.Client

  @doc """
  Create a one-off invoice

  This endpoint is used for issuing a one-off invoice.
  """
  @spec create_invoice(LagoClient.InvoiceOneOffCreateInput.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def create_invoice(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Invoices, :create_invoice},
      url: "/invoices",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.InvoiceOneOffCreateInput, :t}}],
      response: [
        {200, {LagoClient.Invoice, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Download an invoice PDF

  This endpoint is used for downloading a specific invoice PDF document.
  """
  @spec download_invoice(String.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def download_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :download_invoice},
      url: "/invoices/#{lago_id}/download",
      method: :post,
      response: [
        {200, {LagoClient.Invoice, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Finalize a draft invoice

  This endpoint is used for finalizing a draft invoice.
  """
  @spec finalize_invoice(String.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def finalize_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :finalize_invoice},
      url: "/invoices/#{lago_id}/finalize",
      method: :put,
      response: [
        {200, {LagoClient.Invoice, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all invoices

  This endpoint is used for retrieving all invoices.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.
    * `amount_from`: Filter invoices of at least a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `amount_to`: Filter invoices up to a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `issuing_date_from`: Filter invoices starting from a specific date.
    * `issuing_date_to`: Filter invoices up to a specific date.
    * `status`: Filter invoices by status. Possible values are `draft` or `finalized`.
    * `payment_status`: Filter invoices by payment status. Possible values are `pending`, `failed` or `succeeded`.
    * `payment_overdue`: Filter invoices by payment_overdue. Possible values are `true` or `false`.
    * `search_term`: Search invoices by id, number, customer name, customer external_id or customer email.
    * `currency`: Filter invoices by currency. Possible values ISO 4217 currency codes.
    * `payment_dispute_lost`: Filter invoices with a payment dispute lost. Possible values are `true` or `false`.
    * `invoice_type`: Filter invoices by invoice type. Possible values are `subscription`, `add_on`, `credit`, `one_off`, `advance_charges` or `progressive_billing`.
    * `self_billed`: Filter invoices by self billed. Possible values are `true` or `false`.
    * `metadata[key]`: Filter invoices by metadata. Replace `key` with the actual metadata key you want to match, and provide the corresponding value. Providing empty value will search for invoice without given metadata key. For example, `metadata[color]=blue`.

  """
  @spec find_all_invoices(keyword) ::
          {:ok, LagoClient.InvoicesPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_invoices(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :amount_from,
        :amount_to,
        :currency,
        :external_customer_id,
        :invoice_type,
        :issuing_date_from,
        :issuing_date_to,
        :"metadata[key]",
        :page,
        :payment_dispute_lost,
        :payment_overdue,
        :payment_status,
        :per_page,
        :search_term,
        :self_billed,
        :status
      ])

    client.request(%{
      args: [],
      call: {LagoClient.Invoices, :find_all_invoices},
      url: "/invoices",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.InvoicesPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve an invoice

  This endpoint is used for retrieving a specific invoice that has been issued.
  """
  @spec find_invoice(String.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def find_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :find_invoice},
      url: "/invoices/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoClient.Invoice, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate a payment URL

  This endpoint generates a checkout link for a specific invoice.
  """
  @spec invoice_payment_url(String.t(), keyword) ::
          {:ok, LagoClient.InvoicePaymentUrl.t()} | {:error, LagoClient.Error.t()}
  def invoice_payment_url(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :invoice_payment_url},
      url: "/invoices/#{lago_id}/payment_url",
      method: :post,
      response: [
        {200, {LagoClient.InvoicePaymentUrl, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create an invoice preview

  This endpoint is used for generating invoice preview.
  """
  @spec invoice_preview(LagoClient.InvoicePreviewInput.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def invoice_preview(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Invoices, :invoice_preview},
      url: "/invoices/preview",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.InvoicePreviewInput, :t}}],
      response: [
        {200, {LagoClient.Invoice, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Mark an invoice payment dispute as lost

  This endpoint is used for setting invoice's payment dispute as lost.
  """
  @spec lose_dispute_invoice(String.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def lose_dispute_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :lose_dispute_invoice},
      url: "/invoices/#{lago_id}/lose_dispute",
      method: :post,
      response: [
        {200, {LagoClient.Invoice, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {405, {LagoClient.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Refresh a draft invoice

  This endpoint is used for refreshing a draft invoice.
  """
  @spec refresh_invoice(String.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def refresh_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :refresh_invoice},
      url: "/invoices/#{lago_id}/refresh",
      method: :put,
      response: [
        {200, {LagoClient.Invoice, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retry generation of a failed invoice

  This endpoint is used for retrying to generate a failed invoice.
  """
  @spec retry_invoice(String.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def retry_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :retry_invoice},
      url: "/invoices/#{lago_id}/retry",
      method: :post,
      response: [
        {200, {LagoClient.Invoice, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retry an invoice payment

  This endpoint resends an invoice for collection and retry a payment.
  """
  @spec retry_payment(String.t(), keyword) :: :ok | {:error, LagoClient.Error.t()}
  def retry_payment(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :retry_payment},
      url: "/invoices/#{lago_id}/retry_payment",
      method: :post,
      response: [
        {200, :null},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {405, {LagoClient.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an invoice

  This endpoint is used for updating an existing invoice.
  """
  @spec update_invoice(String.t(), LagoClient.InvoiceUpdateInput.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def update_invoice(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {LagoClient.Invoices, :update_invoice},
      url: "/invoices/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.InvoiceUpdateInput, :t}}],
      response: [
        {200, {LagoClient.Invoice, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Void an invoice

  This endpoint is used for voiding an invoice. You can void an invoice only when it's in a `finalized` status, and the payment status is not `succeeded`.
  """
  @spec void_invoice(String.t(), keyword) ::
          {:ok, LagoClient.Invoice.t()} | {:error, LagoClient.Error.t()}
  def void_invoice(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Invoices, :void_invoice},
      url: "/invoices/#{lago_id}/void",
      method: :post,
      response: [
        {200, {LagoClient.Invoice, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
