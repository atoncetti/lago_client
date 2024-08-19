defmodule LagoApiClient.Coupon do
  @moduledoc """
  Provides struct and type for a Coupon
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, coupon: LagoApiClient.CouponObject.t()}

  defstruct [:__info__, :coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupon: {LagoApiClient.CouponObject, :t}]
  end
end
