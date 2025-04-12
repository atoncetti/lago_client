defmodule LagoClient.Payments do
  @moduledoc """
  Provides API endpoints related to payments
  """

  @default_client LagoClient.Client

  @doc """
  Create a payment

  This endpoint is used to create a manual payment
  """
  @spec create_payment(LagoClient.PaymentCreateInput.t(), keyword) ::
          {:ok, LagoClient.Payment.t()} | {:error, LagoClient.Error.t()}
  def create_payment(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Payments, :create_payment},
      url: "/payments",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.PaymentCreateInput, :t}}],
      response: [
        {200, {LagoClient.Payment, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all payments

  This endpoint is used to list all payments

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.
    * `lago_invoice_id`: Unique identifier assigned to the invoice within the Lago application. This ID is exclusively created by Lago and serves as a unique identifier for the invoice's record within the Lago system.

  """
  @spec find_all_payments(keyword) ::
          {:ok, LagoClient.PaymentsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_payments(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :lago_invoice_id, :page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.Payments, :find_all_payments},
      url: "/payments",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.PaymentsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end
end
