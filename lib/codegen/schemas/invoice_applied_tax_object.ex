defmodule LagoClient.InvoiceAppliedTaxObject do
  @moduledoc """
  Provides struct and type for a InvoiceAppliedTaxObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: String.t() | nil,
          created_at: DateTime.t() | nil,
          lago_id: String.t() | nil,
          lago_tax_id: String.t() | nil,
          tax_code: String.t() | nil,
          tax_description: String.t() | nil,
          tax_name: String.t() | nil,
          tax_rate: number | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :created_at,
    :lago_id,
    :lago_tax_id,
    :tax_code,
    :tax_description,
    :tax_name,
    :tax_rate
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency:
        {:enum,
         [
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
      created_at: {:string, :date_time},
      lago_id: {:string, :uuid},
      lago_tax_id: {:string, :uuid},
      tax_code: {:string, :generic},
      tax_description: {:string, :generic},
      tax_name: {:string, :generic},
      tax_rate: :number
    ]
  end
end
