defmodule LagoApiClient.WalletObject do
  @moduledoc """
  Provides struct and type for a WalletObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          balance_cents: integer,
          consumed_credits: String.t(),
          created_at: DateTime.t(),
          credits_balance: String.t(),
          credits_ongoing_balance: String.t(),
          credits_ongoing_usage_balance: String.t(),
          currency: LagoApiClient.WalletObjectCurrency.t(),
          expiration_at: DateTime.t() | nil,
          external_customer_id: String.t(),
          invoice_requires_successful_payment: boolean | nil,
          lago_customer_id: String.t(),
          lago_id: String.t(),
          last_balance_sync_at: DateTime.t() | nil,
          last_consumed_credit_at: DateTime.t() | nil,
          name: String.t() | nil,
          ongoing_balance_cents: integer,
          ongoing_usage_balance_cents: integer,
          rate_amount: String.t(),
          recurring_transaction_rules:
            [LagoApiClient.WalletObjectRecurringTransactionRules.t()] | nil,
          status: String.t(),
          terminated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :balance_cents,
    :consumed_credits,
    :created_at,
    :credits_balance,
    :credits_ongoing_balance,
    :credits_ongoing_usage_balance,
    :currency,
    :expiration_at,
    :external_customer_id,
    :invoice_requires_successful_payment,
    :lago_customer_id,
    :lago_id,
    :last_balance_sync_at,
    :last_consumed_credit_at,
    :name,
    :ongoing_balance_cents,
    :ongoing_usage_balance_cents,
    :rate_amount,
    :recurring_transaction_rules,
    :status,
    :terminated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      balance_cents: :integer,
      consumed_credits: {:string, :generic},
      created_at: {:string, :date_time},
      credits_balance: {:string, :generic},
      credits_ongoing_balance: {:string, :generic},
      credits_ongoing_usage_balance: {:string, :generic},
      currency: {LagoApiClient.WalletObjectCurrency, :t},
      expiration_at: {:string, :date_time},
      external_customer_id: {:string, :generic},
      invoice_requires_successful_payment: :boolean,
      lago_customer_id: {:string, :uuid},
      lago_id: {:string, :uuid},
      last_balance_sync_at: {:string, :date_time},
      last_consumed_credit_at: {:string, :date_time},
      name: {:string, :generic},
      ongoing_balance_cents: :integer,
      ongoing_usage_balance_cents: :integer,
      rate_amount: {:string, :generic},
      recurring_transaction_rules: [{LagoApiClient.WalletObjectRecurringTransactionRules, :t}],
      status: {:enum, ["active", "terminated"]},
      terminated_at: {:string, :date_time}
    ]
  end
end
