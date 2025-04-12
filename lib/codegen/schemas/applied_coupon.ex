defmodule LagoClient.AppliedCoupon do
  @moduledoc """
  Provides struct and type for a AppliedCoupon
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, applied_coupon: LagoClient.AppliedCouponObject.t()}

  defstruct [:__info__, :applied_coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [applied_coupon: {LagoClient.AppliedCouponObject, :t}]
  end
end
