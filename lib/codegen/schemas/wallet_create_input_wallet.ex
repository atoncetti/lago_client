defmodule LagoClient.WalletCreateInputWallet do
  @moduledoc """
  Provides struct and type for a WalletCreateInputWallet
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          currency: String.t(),
          expiration_at: DateTime.t() | nil,
          external_customer_id: String.t(),
          granted_credits: String.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          name: String.t() | nil,
          paid_credits: String.t() | nil,
          rate_amount: String.t(),
          recurring_transaction_rules:
            [LagoClient.WalletCreateInputWalletRecurringTransactionRules.t()] | nil,
          transaction_metadata: [LagoClient.WalletCreateInputWalletTransactionMetadata.t()] | nil
        }

  defstruct [
    :__info__,
    :currency,
    :expiration_at,
    :external_customer_id,
    :granted_credits,
    :invoice_requires_successful_payment,
    :name,
    :paid_credits,
    :rate_amount,
    :recurring_transaction_rules,
    :transaction_metadata
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
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
      expiration_at: {:union, [{:string, :date_time}, :null]},
      external_customer_id: {:string, :generic},
      granted_credits: {:union, [{:string, :generic}, :null]},
      invoice_requires_successful_payment: :boolean,
      name: {:string, :generic},
      paid_credits: {:union, [{:string, :generic}, :null]},
      rate_amount: {:string, :generic},
      recurring_transaction_rules: [
        {LagoClient.WalletCreateInputWalletRecurringTransactionRules, :t}
      ],
      transaction_metadata: [{LagoClient.WalletCreateInputWalletTransactionMetadata, :t}]
    ]
  end
end
