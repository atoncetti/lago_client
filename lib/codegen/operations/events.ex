defmodule LagoApiClient.Events do
  @moduledoc """
  Provides API endpoints related to events
  """

  @default_client LagoApiClient.Client

  @doc """
  Batch multiple events

  This endpoint can be used to send a batch of usage records. Each request may include up to 100 events.
  """
  @spec create_batch_events(LagoApiClient.EventBatchInput.t(), keyword) ::
          :ok | {:error, LagoApiClient.Error.t()}
  def create_batch_events(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.Events, :create_batch_events},
      url: "/events/batch",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.EventBatchInput, :t}}],
      response: [
        {200, :null},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Send usage events

  This endpoint is used for transmitting usage measurement events to either a designated customer or a specific subscription.
  """
  @spec create_event(LagoApiClient.EventInput.t(), keyword) ::
          {:ok, LagoApiClient.Event.t()} | {:error, LagoApiClient.Error.t()}
  def create_event(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.Events, :create_event},
      url: "/events",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.EventInput, :t}}],
      response: [
        {200, {LagoApiClient.Event, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Estimate fees for a pay in advance charge

  Estimate the fees that would be created after reception of an event for a billable metric attached to one or multiple pay in advance charges
  """
  @spec event_estimate_fees(LagoApiClient.EventEstimateFeesInput.t(), keyword) ::
          {:ok, LagoApiClient.Fees.t()} | {:error, LagoApiClient.Error.t()}
  def event_estimate_fees(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.Events, :event_estimate_fees},
      url: "/events/estimate_fees",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.EventEstimateFeesInput, :t}}],
      response: [
        {200, {LagoApiClient.Fees, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a specific event

  This endpoint is used for retrieving a specific usage measurement event that has been sent to a customer or a subscription.
  """
  @spec find_event(String.t(), keyword) ::
          {:ok, LagoApiClient.Event.t()} | {:error, LagoApiClient.Error.t()}
  def find_event(transaction_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [transaction_id: transaction_id],
      call: {LagoApiClient.Events, :find_event},
      url: "/events/#{transaction_id}",
      method: :get,
      response: [
        {200, {LagoApiClient.Event, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end
end
