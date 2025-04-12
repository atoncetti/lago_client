defmodule LagoClient.CouponUpdateInputCoupon do
  @moduledoc """
  Provides struct and type for a CouponUpdateInputCoupon
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: map | nil,
          applies_to: map | nil,
          code: String.t() | nil,
          coupon_type: String.t() | nil,
          description: String.t() | nil,
          expiration: String.t() | nil,
          expiration_at: DateTime.t() | nil,
          frequency: String.t() | nil,
          frequency_duration: integer | nil,
          name: String.t() | nil,
          percentage_rate: String.t() | nil,
          reusable: boolean | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :applies_to,
    :code,
    :coupon_type,
    :description,
    :expiration,
    :expiration_at,
    :frequency,
    :frequency_duration,
    :name,
    :percentage_rate,
    :reusable
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: :map,
      applies_to: :map,
      code: {:string, :generic},
      coupon_type: {:enum, ["fixed_amount", "percentage"]},
      description: {:string, :generic},
      expiration: {:enum, ["no_expiration", "time_limit"]},
      expiration_at: {:string, :date_time},
      frequency: {:enum, ["once", "recurring", "forever"]},
      frequency_duration: :integer,
      name: {:string, :generic},
      percentage_rate: {:string, :generic},
      reusable: :boolean
    ]
  end
end
