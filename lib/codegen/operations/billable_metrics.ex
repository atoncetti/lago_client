defmodule LagoApiClient.BillableMetrics do
  @moduledoc """
  Provides API endpoints related to billable metrics
  """

  @default_client LagoApiClient.Client

  @doc """
  Create a billable metric

  This endpoint creates a new billable metric representing a pricing component of your application.
  """
  @spec create_billable_metric(LagoApiClient.BillableMetricCreateInput.t(), keyword) ::
          {:ok, LagoApiClient.BillableMetric.t()} | {:error, LagoApiClient.Error.t()}
  def create_billable_metric(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.BillableMetrics, :create_billable_metric},
      url: "/billable_metrics",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.BillableMetricCreateInput, :t}}],
      response: [
        {200, {LagoApiClient.BillableMetric, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a billable metric

  This endpoint deletes an existing billable metric representing a pricing component of your application.
  """
  @spec destroy_billable_metric(String.t(), keyword) ::
          {:ok, LagoApiClient.BillableMetric.t()} | {:error, LagoApiClient.Error.t()}
  def destroy_billable_metric(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoApiClient.BillableMetrics, :destroy_billable_metric},
      url: "/billable_metrics/#{code}",
      method: :delete,
      response: [
        {200, {LagoApiClient.BillableMetric, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all billable metrics

  This endpoint retrieves all existing billable metrics that represent pricing components of your application.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_billable_metrics(keyword) ::
          {:ok, LagoApiClient.BillableMetricsPaginated.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_billable_metrics(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoApiClient.BillableMetrics, :find_all_billable_metrics},
      url: "/billable_metrics",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.BillableMetricsPaginated, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a billable metric

  This endpoint retrieves an existing billable metric that represents a pricing component of your application. The billable metric is identified by its unique code.
  """
  @spec find_billable_metric(String.t(), keyword) ::
          {:ok, LagoApiClient.BillableMetric.t()} | {:error, LagoApiClient.Error.t()}
  def find_billable_metric(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoApiClient.BillableMetrics, :find_billable_metric},
      url: "/billable_metrics/#{code}",
      method: :get,
      response: [
        {200, {LagoApiClient.BillableMetric, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a billable metric

  This endpoint updates an existing billable metric representing a pricing component of your application.
  """
  @spec update_billable_metric(String.t(), LagoApiClient.BillableMetricUpdateInput.t(), keyword) ::
          {:ok, LagoApiClient.BillableMetric.t()} | {:error, LagoApiClient.Error.t()}
  def update_billable_metric(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {LagoApiClient.BillableMetrics, :update_billable_metric},
      url: "/billable_metrics/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoApiClient.BillableMetricUpdateInput, :t}}],
      response: [
        {200, {LagoApiClient.BillableMetric, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
