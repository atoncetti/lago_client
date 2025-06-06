defmodule LagoClient.CouponObject do
  @moduledoc """
  Provides struct and type for a CouponObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: String.t() | nil,
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
      amount_cents: {:union, [:integer, :null]},
      amount_currency:
        {:enum,
         [
           nil,
           "AED",
           "AFN",
           "ALL",
           "AMD",
           "ANG",
           "AOA",
           "ARS",
           "AUD",
           "AWG",
           "AZN",
           "BAM",
           "BBD",
           "BDT",
           "BGN",
           "BIF",
           "BMD",
           "BND",
           "BOB",
           "BRL",
           "BSD",
           "BWP",
           "BYN",
           "BZD",
           "CAD",
           "CDF",
           "CHF",
           "CLF",
           "CLP",
           "CNY",
           "COP",
           "CRC",
           "CVE",
           "CZK",
           "DJF",
           "DKK",
           "DOP",
           "DZD",
           "EGP",
           "ETB",
           "EUR",
           "FJD",
           "FKP",
           "GBP",
           "GEL",
           "GIP",
           "GMD",
           "GNF",
           "GTQ",
           "GYD",
           "HKD",
           "HNL",
           "HRK",
           "HTG",
           "HUF",
           "IDR",
           "ILS",
           "INR",
           "ISK",
           "JMD",
           "JPY",
           "KES",
           "KGS",
           "KHR",
           "KMF",
           "KRW",
           "KYD",
           "KZT",
           "LAK",
           "LBP",
           "LKR",
           "LRD",
           "LSL",
           "MAD",
           "MDL",
           "MGA",
           "MKD",
           "MMK",
           "MNT",
           "MOP",
           "MRO",
           "MUR",
           "MVR",
           "MWK",
           "MXN",
           "MYR",
           "MZN",
           "NAD",
           "NGN",
           "NIO",
           "NOK",
           "NPR",
           "NZD",
           "PAB",
           "PEN",
           "PGK",
           "PHP",
           "PKR",
           "PLN",
           "PYG",
           "QAR",
           "RON",
           "RSD",
           "RUB",
           "RWF",
           "SAR",
           "SBD",
           "SCR",
           "SEK",
           "SGD",
           "SHP",
           "SLL",
           "SOS",
           "SRD",
           "STD",
           "SZL",
           "THB",
           "TJS",
           "TOP",
           "TRY",
           "TTD",
           "TWD",
           "TZS",
           "UAH",
           "UGX",
           "USD",
           "UYU",
           "UZS",
           "VND",
           "VUV",
           "WST",
           "XAF",
           "XCD",
           "XOF",
           "XPF",
           "YER",
           "ZAR",
           "ZMW"
         ]},
      billable_metric_codes: [string: :generic],
      code: {:string, :generic},
      coupon_type: {:enum, ["fixed_amount", "percentage"]},
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      expiration: {:enum, ["no_expiration", "time_limit"]},
      expiration_at: {:union, [{:string, :date_time}, :null]},
      frequency: {:enum, ["once", "recurring", "forever"]},
      frequency_duration: {:union, [:integer, :null]},
      lago_id: {:string, :uuid},
      limited_billable_metrics: :boolean,
      limited_plans: :boolean,
      name: {:string, :generic},
      percentage_rate: {:union, [{:string, :generic}, :null]},
      plan_codes: [string: :generic],
      reusable: :boolean,
      terminated_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
