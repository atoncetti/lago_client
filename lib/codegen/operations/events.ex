defmodule LagoClient.Events do
  @moduledoc """
  Provides API endpoints related to events
  """

  @default_client LagoClient.Client

  @doc """
  Batch multiple events

  This endpoint can be used to send a batch of usage records. Each request may include up to 100 events.
  """
  @spec create_batch_events(LagoClient.EventBatchInput.t(), keyword) ::
          :ok | {:error, LagoClient.Error.t()}
  def create_batch_events(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Events, :create_batch_events},
      url: "/events/batch",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.EventBatchInput, :t}}],
      response: [
        {200, :null},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Send usage events

  This endpoint is used for transmitting usage measurement events to either a designated customer or a specific subscription.
  """
  @spec create_event(LagoClient.EventInput.t(), keyword) ::
          {:ok, LagoClient.Event.t()} | {:error, LagoClient.Error.t()}
  def create_event(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Events, :create_event},
      url: "/events",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.EventInput, :t}}],
      response: [
        {200, {LagoClient.Event, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Estimate fees for a pay in advance charge

  Estimate the fees that would be created after reception of an event for a billable metric attached to one or multiple pay in advance charges
  """
  @spec event_estimate_fees(LagoClient.EventEstimateFeesInput.t(), keyword) ::
          {:ok, LagoClient.Fees.t()} | {:error, LagoClient.Error.t()}
  def event_estimate_fees(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Events, :event_estimate_fees},
      url: "/events/estimate_fees",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.EventEstimateFeesInput, :t}}],
      response: [
        {200, {LagoClient.Fees, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all events

  This endpoint is used for retrieving all events.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_subscription_id`: External subscription ID
    * `code`: Filter events by its code.
    * `timestamp_from`: Filter events by timestamp starting from a specific date.
    * `timestamp_to`: Filter events by timestamp up to a specific date.

  """
  @spec find_all_events(keyword) ::
          {:ok, LagoClient.EventsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_events(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :code,
        :external_subscription_id,
        :page,
        :per_page,
        :timestamp_from,
        :timestamp_to
      ])

    client.request(%{
      args: [],
      call: {LagoClient.Events, :find_all_events},
      url: "/events",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.EventsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a specific event

  This endpoint is used for retrieving a specific usage measurement event that has been sent to a customer or a subscription.
  """
  @spec find_event(String.t(), keyword) ::
          {:ok, LagoClient.Event.t()} | {:error, LagoClient.Error.t()}
  def find_event(transaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [transaction_id: transaction_id],
      call: {LagoClient.Events, :find_event},
      url: "/events/#{transaction_id}",
      method: :get,
      response: [
        {200, {LagoClient.Event, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
