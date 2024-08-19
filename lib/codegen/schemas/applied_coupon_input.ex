defmodule LagoApiClient.AppliedCouponInput do
  @moduledoc """
  Provides struct and type for a AppliedCouponInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_coupon: LagoApiClient.AppliedCouponInputAppliedCoupon.t()
        }

  defstruct [:__info__, :applied_coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [applied_coupon: {LagoApiClient.AppliedCouponInputAppliedCoupon, :t}]
  end
end
