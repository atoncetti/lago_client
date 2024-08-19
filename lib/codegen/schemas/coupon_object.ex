defmodule LagoApiClient.CouponObject do
  @moduledoc """
  Provides struct and type for a CouponObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: LagoApiClient.CouponObjectAmountCurrency.t() | nil,
          billable_metric_codes: [String.t()] | nil,
          code: String.t(),
          coupon_type: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          expiration: String.t(),
          expiration_at: DateTime.t() | nil,
          frequency: String.t(),
          frequency_duration: integer | nil,
          lago_id: String.t(),
          limited_billable_metrics: boolean,
          limited_plans: boolean,
          name: String.t(),
          percentage_rate: String.t() | nil,
          plan_codes: [String.t()] | nil,
          reusable: boolean,
          terminated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :billable_metric_codes,
    :code,
    :coupon_type,
    :created_at,
    :description,
    :expiration,
    :expiration_at,
    :frequency,
    :frequency_duration,
    :lago_id,
    :limited_billable_metrics,
    :limited_plans,
    :name,
    :percentage_rate,
    :plan_codes,
    :reusable,
    :terminated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {LagoApiClient.CouponObjectAmountCurrency, :t},
      billable_metric_codes: [string: :generic],
      code: {:string, :generic},
      coupon_type: {:enum, ["fixed_amount", "percentage"]},
      created_at: {:string, :date_time},
      description: {:string, :generic},
      expiration: {:enum, ["no_expiration", "time_limit"]},
      expiration_at: {:string, :date_time},
      frequency: {:enum, ["once", "recurring", "forever"]},
      frequency_duration: :integer,
      lago_id: {:string, :uuid},
      limited_billable_metrics: :boolean,
      limited_plans: :boolean,
      name: {:string, :generic},
      percentage_rate: {:string, :generic},
      plan_codes: [string: :generic],
      reusable: :boolean,
      terminated_at: {:string, :date_time}
    ]
  end
end
