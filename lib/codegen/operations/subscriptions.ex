defmodule LagoClient.Subscriptions do
  @moduledoc """
  Provides API endpoints related to subscriptions
  """

  @default_client LagoClient.Client

  @doc """
  Assign a plan to a customer

  This endpoint assigns a plan to a customer, creating or modifying a subscription. Ideal for initial subscriptions or plan changes (upgrades/downgrades).
  """
  @spec create_subscription(LagoClient.SubscriptionCreateInput.t(), keyword) ::
          {:ok, LagoClient.Subscription.t()} | {:error, LagoClient.Error.t()}
  def create_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Subscriptions, :create_subscription},
      url: "/subscriptions",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.SubscriptionCreateInput, :t}}],
      response: [
        {200, {LagoClient.Subscription, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Terminate a subscription

  This endpoint allows you to terminate a subscription.

  ## Options

    * `status`: If the field is not defined, Lago will terminate only `active` subscriptions. However, if you wish to cancel a `pending` subscription, please ensure that you include `status=pending` in your request.

  """
  @spec destroy_subscription(String.t(), keyword) ::
          {:ok, LagoClient.Subscription.t()} | {:error, LagoClient.Error.t()}
  def destroy_subscription(external_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:status])

    client.request(%{
      args: [external_id: external_id],
      call: {LagoClient.Subscriptions, :destroy_subscription},
      url: "/subscriptions/#{external_id}",
      method: :delete,
      query: query,
      response: [
        {200, {LagoClient.Subscription, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {405, {LagoClient.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all subscriptions

  This endpoint retrieves all active subscriptions.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: The customer external unique identifier (provided by your own application)
    * `plan_code`: The unique code representing the plan to be attached to the customer. This code must correspond to the code property of one of the active plans.
    * `status[]`: If the field is not defined, Lago will return only `active` subscriptions. However, if you wish to fetch subscriptions by different status you can define them in a status[] query param. Available filter values: `pending`, `canceled`, `terminated`, `active`.

  """
  @spec find_all_subscriptions(keyword) ::
          {:ok, LagoClient.SubscriptionsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_subscriptions(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :per_page, :plan_code, :"status[]"])

    client.request(%{
      args: [],
      call: {LagoClient.Subscriptions, :find_all_subscriptions},
      url: "/subscriptions",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.SubscriptionsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a subscription

  This endpoint retrieves a specific subscription.
  """
  @spec find_subscription(String.t(), keyword) ::
          {:ok, LagoClient.Subscription.t()} | {:error, LagoClient.Error.t()}
  def find_subscription(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {LagoClient.Subscriptions, :find_subscription},
      url: "/subscriptions/#{external_id}",
      method: :get,
      response: [
        {200, {LagoClient.Subscription, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrive subscription lifetime usage

  This endpoint enables the retrieval of the lifetime usage of a subscription.
  """
  @spec get_subscription_lifetime_usage(String.t(), keyword) ::
          {:ok, LagoClient.LifetimeUsage.t()} | {:error, LagoClient.Error.t()}
  def get_subscription_lifetime_usage(external_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id],
      call: {LagoClient.Subscriptions, :get_subscription_lifetime_usage},
      url: "/subscriptions/#{external_id}/lifetime_usage",
      method: :get,
      response: [
        {200, {LagoClient.LifetimeUsage, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a subscription

  This endpoint allows you to update a subscription.
  """
  @spec update_subscription(String.t(), LagoClient.SubscriptionUpdateInput.t(), keyword) ::
          {:ok, LagoClient.Subscription.t()} | {:error, LagoClient.Error.t()}
  def update_subscription(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {LagoClient.Subscriptions, :update_subscription},
      url: "/subscriptions/#{external_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.SubscriptionUpdateInput, :t}}],
      response: [
        {200, {LagoClient.Subscription, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a subscription lifetime usage

  This endpoint allows you to update the lifetime usage of a subscription.
  """
  @spec update_subscription_lifetime_usage(String.t(), LagoClient.LifetimeUsageInput.t(), keyword) ::
          {:ok, LagoClient.LifetimeUsage.t()} | {:error, LagoClient.Error.t()}
  def update_subscription_lifetime_usage(external_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_id: external_id, body: body],
      call: {LagoClient.Subscriptions, :update_subscription_lifetime_usage},
      url: "/subscriptions/#{external_id}/lifetime_usage",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.LifetimeUsageInput, :t}}],
      response: [
        {200, {LagoClient.LifetimeUsage, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
