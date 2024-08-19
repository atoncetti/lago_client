defmodule LagoApiClient.WalletObjectRecurringTransactionRules do
  @moduledoc """
  Provides struct and type for a WalletObjectRecurringTransactionRules
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          granted_credits: String.t(),
          interval: String.t(),
          invoice_requires_successful_payment: boolean | nil,
          lago_id: String.t(),
          method: String.t(),
          paid_credits: String.t(),
          started_at: DateTime.t() | nil,
          target_ongoing_balance: String.t(),
          threshold_credits: String.t(),
          transaction_metadata:
            [LagoApiClient.WalletObjectRecurringTransactionRulesTransactionMetadata.t()] | nil,
          trigger: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :granted_credits,
    :interval,
    :invoice_requires_successful_payment,
    :lago_id,
    :method,
    :paid_credits,
    :started_at,
    :target_ongoing_balance,
    :threshold_credits,
    :transaction_metadata,
    :trigger
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      granted_credits: {:string, :generic},
      interval: {:enum, ["weekly", "monthly", "quarterly", "yearly"]},
      invoice_requires_successful_payment: :boolean,
      lago_id: {:string, :uuid},
      method: {:enum, ["fixed", "target"]},
      paid_credits: {:string, :generic},
      started_at: {:string, :date_time},
      target_ongoing_balance: {:string, :generic},
      threshold_credits: {:string, :generic},
      transaction_metadata: [
        {LagoApiClient.WalletObjectRecurringTransactionRulesTransactionMetadata, :t}
      ],
      trigger: {:enum, ["interval", "threshold"]}
    ]
  end
end
