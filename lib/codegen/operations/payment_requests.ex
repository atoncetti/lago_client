defmodule LagoClient.PaymentRequests do
  @moduledoc """
  Provides API endpoints related to payment requests
  """

  @default_client LagoClient.Client

  @doc """
  Create a payment request

  This endpoint is used to create a payment request to collect payments of overdue invoices of a given customer
  """
  @spec create_payment_request(LagoClient.PaymentRequestCreateInput.t(), keyword) ::
          {:ok, LagoClient.PaymentRequest.t()} | {:error, LagoClient.Error.t()}
  def create_payment_request(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.PaymentRequests, :create_payment_request},
      url: "/payment_requests",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.PaymentRequestCreateInput, :t}}],
      response: [
        {200, {LagoClient.PaymentRequest, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all payment requests

  This endpoint is used to list all existing payment requests.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.

  """
  @spec find_all_payment_requests(keyword) ::
          {:ok, LagoClient.PaymentRequestsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_payment_requests(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.PaymentRequests, :find_all_payment_requests},
      url: "/payment_requests",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.PaymentRequestsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end
end
