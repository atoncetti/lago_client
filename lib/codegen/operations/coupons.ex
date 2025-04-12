defmodule LagoClient.Coupons do
  @moduledoc """
  Provides API endpoints related to coupons
  """

  @default_client LagoClient.Client

  @doc """
  Apply a coupon to a customer

  This endpoint is used to apply a specific coupon to a customer, before or during a subscription.
  """
  @spec apply_coupon(LagoClient.AppliedCouponInput.t(), keyword) ::
          {:ok, LagoClient.AppliedCoupon.t()} | {:error, LagoClient.Error.t()}
  def apply_coupon(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Coupons, :apply_coupon},
      url: "/applied_coupons",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.AppliedCouponInput, :t}}],
      response: [
        {200, {LagoClient.AppliedCoupon, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a coupon

  This endpoint is used to create a coupon that can be then attached to a customer to create a discount.
  """
  @spec create_coupon(LagoClient.CouponCreateInput.t(), keyword) ::
          {:ok, LagoClient.Coupon.t()} | {:error, LagoClient.Error.t()}
  def create_coupon(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Coupons, :create_coupon},
      url: "/coupons",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.CouponCreateInput, :t}}],
      response: [
        {200, {LagoClient.Coupon, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an applied coupon

  This endpoint is used to delete a specific coupon that has been applied to a customer.
  """
  @spec delete_applied_coupon(String.t(), String.t(), keyword) ::
          {:ok, LagoClient.AppliedCoupon.t()} | {:error, LagoClient.Error.t()}
  def delete_applied_coupon(external_customer_id, applied_coupon_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [external_customer_id: external_customer_id, applied_coupon_id: applied_coupon_id],
      call: {LagoClient.Coupons, :delete_applied_coupon},
      url: "/customers/#{external_customer_id}/applied_coupons/#{applied_coupon_id}",
      method: :delete,
      response: [
        {200, {LagoClient.AppliedCoupon, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a coupon

  This endpoint is used to delete a coupon.
  """
  @spec destroy_coupon(String.t(), keyword) ::
          {:ok, LagoClient.Coupon.t()} | {:error, LagoClient.Error.t()}
  def destroy_coupon(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.Coupons, :destroy_coupon},
      url: "/coupons/#{code}",
      method: :delete,
      response: [
        {200, {LagoClient.Coupon, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all applied coupons

  This endpoint is used to list all applied coupons. You can filter by coupon status and by customer.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `status`: The status of the coupon. Can be either `active` or `terminated`.
    * `external_customer_id`: The customer external unique identifier (provided by your own application)

  """
  @spec find_all_applied_coupons(keyword) ::
          {:ok, LagoClient.AppliedCouponsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_applied_coupons(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :per_page, :status])

    client.request(%{
      args: [],
      call: {LagoClient.Coupons, :find_all_applied_coupons},
      url: "/applied_coupons",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.AppliedCouponsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all coupons

  This endpoint is used to list all existing coupons.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.

  """
  @spec find_all_coupons(keyword) ::
          {:ok, LagoClient.CouponsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_coupons(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.Coupons, :find_all_coupons},
      url: "/coupons",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.CouponsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a coupon

  This endpoint is used to retrieve a specific coupon.
  """
  @spec find_coupon(String.t(), keyword) ::
          {:ok, LagoClient.Coupon.t()} | {:error, LagoClient.Error.t()}
  def find_coupon(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {LagoClient.Coupons, :find_coupon},
      url: "/coupons/#{code}",
      method: :get,
      response: [
        {200, {LagoClient.Coupon, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a coupon

  This endpoint is used to update a coupon that can be then attached to a customer to create a discount.
  """
  @spec update_coupon(String.t(), LagoClient.CouponUpdateInput.t(), keyword) ::
          {:ok, LagoClient.Coupon.t()} | {:error, LagoClient.Error.t()}
  def update_coupon(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {LagoClient.Coupons, :update_coupon},
      url: "/coupons/#{code}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.CouponUpdateInput, :t}}],
      response: [
        {200, {LagoClient.Coupon, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
