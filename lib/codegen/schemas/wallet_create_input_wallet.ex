defmodule LagoApiClient.WalletCreateInputWallet do
  @moduledoc """
  Provides struct and type for a WalletCreateInputWallet
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          currency: LagoApiClient.WalletCreateInputWalletCurrency.t(),
          expiration_at: DateTime.t() | nil,
          external_customer_id: String.t(),
          granted_credits: String.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          name: String.t() | nil,
          paid_credits: String.t() | nil,
          rate_amount: String.t(),
          recurring_transaction_rules:
            [LagoApiClient.WalletCreateInputWalletRecurringTransactionRules.t()] | nil,
          transaction_metadata:
            [LagoApiClient.WalletCreateInputWalletTransactionMetadata.t()] | nil
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
      currency: {LagoApiClient.WalletCreateInputWalletCurrency, :t},
      expiration_at: {:string, :date_time},
      external_customer_id: {:string, :generic},
      granted_credits: {:string, :generic},
      invoice_requires_successful_payment: :boolean,
      name: {:string, :generic},
      paid_credits: {:string, :generic},
      rate_amount: {:string, :generic},
      recurring_transaction_rules: [
        {LagoApiClient.WalletCreateInputWalletRecurringTransactionRules, :t}
      ],
      transaction_metadata: [{LagoApiClient.WalletCreateInputWalletTransactionMetadata, :t}]
    ]
  end
end
