defmodule LagoApiClient.CouponUpdateInput do
  @moduledoc """
  Provides struct and type for a CouponUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, coupon: LagoApiClient.CouponUpdateInputCoupon.t()}

  defstruct [:__info__, :coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupon: {LagoApiClient.CouponUpdateInputCoupon, :t}]
  end
end
