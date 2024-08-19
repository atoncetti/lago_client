defmodule LagoApiClient.AppliedCouponInputAppliedCoupon do
  @moduledoc """
  Provides struct and type for a AppliedCouponInputAppliedCoupon
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: LagoApiClient.AppliedCouponInputAppliedCouponAmountCurrency.t() | nil,
          coupon_code: String.t(),
          external_customer_id: String.t(),
          frequency: String.t() | nil,
          frequency_duration: integer | nil,
          percentage_rate: String.t() | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :coupon_code,
    :external_customer_id,
    :frequency,
    :frequency_duration,
    :percentage_rate
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {LagoApiClient.AppliedCouponInputAppliedCouponAmountCurrency, :t},
      coupon_code: {:string, :generic},
      external_customer_id: {:string, :generic},
      frequency: {:enum, ["once", "recurring", "forever"]},
      frequency_duration: :integer,
      percentage_rate: {:string, :generic}
    ]
  end
end
