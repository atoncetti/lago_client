defmodule LagoApiClient.WalletUpdateInputWallet do
  @moduledoc """
  Provides struct and type for a WalletUpdateInputWallet
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          expiration_at: DateTime.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          name: String.t() | nil,
          recurring_transaction_rules:
            [LagoApiClient.WalletUpdateInputWalletRecurringTransactionRules.t()] | nil
        }

  defstruct [
    :__info__,
    :expiration_at,
    :invoice_requires_successful_payment,
    :name,
    :recurring_transaction_rules
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expiration_at: {:string, :date_time},
      invoice_requires_successful_payment: :boolean,
      name: {:string, :generic},
      recurring_transaction_rules: [
        {LagoApiClient.WalletUpdateInputWalletRecurringTransactionRules, :t}
      ]
    ]
  end
end
