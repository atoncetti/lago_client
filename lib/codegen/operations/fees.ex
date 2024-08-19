defmodule LagoApiClient.Fees do
  @moduledoc """
  Provides API endpoints related to fees
  """
  use LagoApiClient.Encoder

  @default_client LagoApiClient.Client

  @doc """
  Delete a fee

  This endpoint is used for deleting a specific fee that has not yet been invoiced
  """
  @spec delete_fee(String.t(), keyword) ::
          {:ok, LagoApiClient.Fee.t()} | {:error, LagoApiClient.Error.t()}
  def delete_fee(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.Fees, :delete_fee},
      url: "/fees/#{lago_id}",
      method: :delete,
      response: [
        {200, {LagoApiClient.Fee, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {405, {LagoApiClient.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all fees

  This endpoint is used for retrieving all fees that has been issued.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.
    * `external_subscription_id`: External subscription ID
    * `currency`: Filter results by fee's currency.
    * `fee_type`: The fee type. Possible values are `add-on`, `charge`, `credit` or `subscription`.
    * `billable_metric_code`: Filter results by the `code` of the billable metric attached to the fee. Only applies to `charge` types.
    * `payment_status`: Indicates the payment status of the fee. It represents the current status of the payment associated with the fee. The possible values for this field are `pending`, `succeeded`, `failed` and refunded`.
    * `created_at_from`: Filter results created after creation date and time in UTC.
    * `created_at_to`: Filter results created before creation date and time in UTC.
    * `succeeded_at_from`: Filter results with payment success after creation date and time in UTC.
    * `succeeded_at_to`: Filter results with payment success after creation date and time in UTC.
    * `failed_at_from`: Filter results with payment failure after creation date and time in UTC.
    * `failed_at_to`: Filter results with payment failure after creation date and time in UTC.
    * `refunded_at_from`: Filter results with payment refund after creation date and time in UTC.
    * `refunded_at_to`: Filter results with payment refund after creation date and time in UTC.

  """
  @spec find_all_fees(keyword) ::
          {:ok, LagoApiClient.FeesPaginated.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_fees(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :billable_metric_code,
        :created_at_from,
        :created_at_to,
        :currency,
        :external_customer_id,
        :external_subscription_id,
        :failed_at_from,
        :failed_at_to,
        :fee_type,
        :page,
        :payment_status,
        :per_page,
        :refunded_at_from,
        :refunded_at_to,
        :succeeded_at_from,
        :succeeded_at_to
      ])

    client.request(%{
      args: [],
      call: {LagoApiClient.Fees, :find_all_fees},
      url: "/fees",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.FeesPaginated, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a specific fee

  This endpoint is used for retrieving a specific fee that has been issued.
  """
  @spec find_fee(String.t(), keyword) ::
          {:ok, LagoApiClient.Fee.t()} | {:error, LagoApiClient.Error.t()}
  def find_fee(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.Fees, :find_fee},
      url: "/fees/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoApiClient.Fee, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a fee

  This endpoint is used for updating a specific fee that has been issued.
  """
  @spec update_fee(String.t(), LagoApiClient.FeeUpdateInput.t(), keyword) ::
          {:ok, LagoApiClient.Fee.t()} | {:error, LagoApiClient.Error.t()}
  def update_fee(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {LagoApiClient.Fees, :update_fee},
      url: "/fees/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoApiClient.FeeUpdateInput, :t}}],
      response: [
        {200, {LagoApiClient.Fee, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {405, {LagoApiClient.ApiErrorNotAllowed, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{__info__: map, fees: [LagoApiClient.FeeObject.t()]}

  defstruct [:__info__, :fees]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fees: [{LagoApiClient.FeeObject, :t}]]
  end
end
