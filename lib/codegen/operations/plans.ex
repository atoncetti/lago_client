defmodule LagoClient.Plans do
  @moduledoc """
  Provides API endpoints related to plans
  """

  @default_client LagoClient.Client

  @doc """
  Create a plan

  This endpoint creates a plan with subscription and usage-based charges. It supports flexible billing cadence (in-advance or in-arrears) and allows for both recurring and metered charges.
  """
  @spec create_plan(LagoClient.PlanCreateInput.t(), keyword) ::
          {:ok, LagoClient.Plan.t()} | {:error, LagoClient.Error.t()}
  def create_plan(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Plans, :create_plan},
      url: "/plans",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.PlanCreateInput, :t}}],
      response: [
        {200, {LagoClient.Plan, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a plan

  This endpoint deletes a specific plan. Note that this plan could be associated with active subscriptions.
  """
  @spec destroy_plan(String.t(), keyword) ::
          {:ok, LagoClient.Plan.t()} | {:error, LagoClient.Error.t()}
  def destroy_plan(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.Plans, :destroy_plan},
      url: "/plans/#{code}",
      method: :delete,
      response: [
        {200, {LagoClient.Plan, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all plans

  This endpoint retrieves all existing plans.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_plans(keyword) ::
          {:ok, LagoClient.PlansPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_plans(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.Plans, :find_all_plans},
      url: "/plans",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.PlansPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a plan

  This endpoint retrieves a specific plan.
  """
  @spec find_plan(String.t(), keyword) ::
          {:ok, LagoClient.Plan.t()} | {:error, LagoClient.Error.t()}
  def find_plan(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.Plans, :find_plan},
      url: "/plans/#{code}",
      method: :get,
      response: [
        {200, {LagoClient.Plan, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a plan

  This endpoint updates a specific plan with subscription and usage-based charges. It supports flexible billing cadence (in-advance or in-arrears) and allows for both recurring and metered charges.
  """
  @spec update_plan(String.t(), LagoClient.PlanUpdateInput.t(), keyword) ::
          {:ok, LagoClient.Plan.t()} | {:error, LagoClient.Error.t()}
  def update_plan(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {LagoClient.Plans, :update_plan},
      url: "/plans/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.PlanUpdateInput, :t}}],
      response: [
        {200, {LagoClient.Plan, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
