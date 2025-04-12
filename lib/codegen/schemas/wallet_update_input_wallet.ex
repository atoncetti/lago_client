defmodule LagoClient.WalletUpdateInputWallet do
  @moduledoc """
  Provides struct and type for a WalletUpdateInputWallet
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          expiration_at: DateTime.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          name: String.t() | nil,
          recurring_transaction_rules:
            [LagoClient.WalletUpdateInputWalletRecurringTransactionRules.t()] | nil
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
      expiration_at: {:union, [{:string, :date_time}, :null]},
      invoice_requires_successful_payment: :boolean,
      name: {:union, [{:string, :generic}, :null]},
      recurring_transaction_rules: [
        {LagoClient.WalletUpdateInputWalletRecurringTransactionRules, :t}
      ]
    ]
  end
end
