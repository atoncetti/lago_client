defmodule LagoApiClient.AppliedCouponObject do
  @moduledoc """
  Provides struct and type for a AppliedCouponObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_cents_remaining: integer | nil,
          amount_currency: map | nil,
          coupon_code: String.t(),
          coupon_name: String.t(),
          created_at: DateTime.t(),
          expiration_at: DateTime.t() | nil,
          external_customer_id: String.t(),
          frequency: String.t(),
          frequency_duration: integer | nil,
          frequency_duration_remaining: integer | nil,
          lago_coupon_id: String.t(),
          lago_customer_id: String.t(),
          lago_id: String.t(),
          percentage_rate: String.t() | nil,
          status: String.t(),
          terminated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_cents_remaining,
    :amount_currency,
    :coupon_code,
    :coupon_name,
    :created_at,
    :expiration_at,
    :external_customer_id,
    :frequency,
    :frequency_duration,
    :frequency_duration_remaining,
    :lago_coupon_id,
    :lago_customer_id,
    :lago_id,
    :percentage_rate,
    :status,
    :terminated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_cents_remaining: :integer,
      amount_currency: :map,
      coupon_code: {:string, :generic},
      coupon_name: {:string, :generic},
      created_at: {:string, :date_time},
      expiration_at: {:string, :date_time},
      external_customer_id: {:string, :generic},
      frequency: {:enum, ["once", "recurring", "forever"]},
      frequency_duration: :integer,
      frequency_duration_remaining: :integer,
      lago_coupon_id: {:string, :uuid},
      lago_customer_id: {:string, :uuid},
      lago_id: {:string, :uuid},
      percentage_rate: {:string, :generic},
      status: {:enum, ["active", "terminated"]},
      terminated_at: {:string, :date_time}
    ]
  end
end
