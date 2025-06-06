defmodule LagoClient.CreditNoteEstimatedEstimatedCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimatedEstimatedCreditNote
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_taxes:
            [LagoClient.CreditNoteEstimatedEstimatedCreditNoteAppliedTaxes.t()] | nil,
          coupons_adjustment_amount_cents: integer,
          currency: String.t(),
          invoice_number: String.t(),
          items: [LagoClient.CreditNoteEstimatedEstimatedCreditNoteItems.t()],
          lago_invoice_id: String.t(),
          max_creditable_amount_cents: integer,
          max_refundable_amount_cents: integer,
          sub_total_excluding_taxes_amount_cents: integer,
          taxes_amount_cents: integer,
          taxes_rate: number
        }

  defstruct [
    :__info__,
    :applied_taxes,
    :coupons_adjustment_amount_cents,
    :currency,
    :invoice_number,
    :items,
    :lago_invoice_id,
    :max_creditable_amount_cents,
    :max_refundable_amount_cents,
    :sub_total_excluding_taxes_amount_cents,
    :taxes_amount_cents,
    :taxes_rate
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_taxes: [{LagoClient.CreditNoteEstimatedEstimatedCreditNoteAppliedTaxes, :t}],
      coupons_adjustment_amount_cents: :integer,
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
      invoice_number: {:string, :generic},
      items: [{LagoClient.CreditNoteEstimatedEstimatedCreditNoteItems, :t}],
      lago_invoice_id: {:string, :uuid},
      max_creditable_amount_cents: :integer,
      max_refundable_amount_cents: :integer,
      sub_total_excluding_taxes_amount_cents: :integer,
      taxes_amount_cents: :integer,
      taxes_rate: :number
    ]
  end
end
