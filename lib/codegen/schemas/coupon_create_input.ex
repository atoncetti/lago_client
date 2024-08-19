defmodule LagoApiClient.CouponCreateInput do
  @moduledoc """
  Provides struct and type for a CouponCreateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, coupon: LagoApiClient.CouponCreateInputCoupon.t()}

  defstruct [:__info__, :coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupon: {LagoApiClient.CouponCreateInputCoupon, :t}]
  end
end
