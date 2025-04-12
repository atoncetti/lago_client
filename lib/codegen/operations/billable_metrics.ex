defmodule LagoClient.BillableMetrics do
  @moduledoc """
  Provides API endpoints related to billable metrics
  """

  @default_client LagoClient.Client

  @doc """
  Create a billable metric

  This endpoint creates a new billable metric representing a pricing component of your application.
  """
  @spec create_billable_metric(LagoClient.BillableMetricCreateInput.t(), keyword) ::
          {:ok, LagoClient.BillableMetric.t()} | {:error, LagoClient.Error.t()}
  def create_billable_metric(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.BillableMetrics, :create_billable_metric},
      url: "/billable_metrics",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.BillableMetricCreateInput, :t}}],
      response: [
        {200, {LagoClient.BillableMetric, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a billable metric

  This endpoint deletes an existing billable metric representing a pricing component of your application.
  """
  @spec destroy_billable_metric(String.t(), keyword) ::
          {:ok, LagoClient.BillableMetric.t()} | {:error, LagoClient.Error.t()}
  def destroy_billable_metric(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.BillableMetrics, :destroy_billable_metric},
      url: "/billable_metrics/#{code}",
      method: :delete,
      response: [
        {200, {LagoClient.BillableMetric, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Evaluate an expression for a billable metric

  Evaluate an expression for a billable metric creation by providing the expression and test data
  """
  @spec evaluate_billable_metric_expression(
          LagoClient.BillableMetricEvaluateExpressionInput.t(),
          keyword
        ) ::
          {:ok, LagoClient.BillableMetricEvaluateExpressionResult.t()}
          | {:error, LagoClient.Error.t()}
  def evaluate_billable_metric_expression(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.BillableMetrics, :evaluate_billable_metric_expression},
      url: "/billable_metrics/evaluate_expression",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.BillableMetricEvaluateExpressionInput, :t}}],
      response: [
        {200, {LagoClient.BillableMetricEvaluateExpressionResult, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
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
          {:ok, LagoClient.BillableMetricsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_billable_metrics(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.BillableMetrics, :find_all_billable_metrics},
      url: "/billable_metrics",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.BillableMetricsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a billable metric

  This endpoint retrieves an existing billable metric that represents a pricing component of your application. The billable metric is identified by its unique code.
  """
  @spec find_billable_metric(String.t(), keyword) ::
          {:ok, LagoClient.BillableMetric.t()} | {:error, LagoClient.Error.t()}
  def find_billable_metric(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.BillableMetrics, :find_billable_metric},
      url: "/billable_metrics/#{code}",
      method: :get,
      response: [
        {200, {LagoClient.BillableMetric, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a billable metric

  This endpoint updates an existing billable metric representing a pricing component of your application.
  """
  @spec update_billable_metric(String.t(), LagoClient.BillableMetricUpdateInput.t(), keyword) ::
          {:ok, LagoClient.BillableMetric.t()} | {:error, LagoClient.Error.t()}
  def update_billable_metric(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {LagoClient.BillableMetrics, :update_billable_metric},
      url: "/billable_metrics/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.BillableMetricUpdateInput, :t}}],
      response: [
        {200, {LagoClient.BillableMetric, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
