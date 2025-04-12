defmodule LagoClient.GrossRevenueObject do
  @moduledoc """
  Provides struct and type for a GrossRevenueObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          currency: String.t(),
          invoices_count: integer,
          month: String.t()
        }

  defstruct [:__info__, :amount_cents, :currency, :invoices_count, :month]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      currency:
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
      invoices_count: :integer,
      month: {:string, :generic}
    ]
  end
end
