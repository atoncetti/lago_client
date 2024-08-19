defmodule LagoApiClient.WalletUpdateInputWalletRecurringTransactionRules do
  @moduledoc """
  Provides struct and type for a WalletUpdateInputWalletRecurringTransactionRules
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          granted_credits: String.t() | nil,
          interval: String.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          lago_id: String.t() | nil,
          method: String.t() | nil,
          paid_credits: String.t() | nil,
          started_at: DateTime.t() | nil,
          target_ongoing_balance: String.t() | nil,
          threshold_credits: String.t() | nil,
          transaction_metadata:
            [
              LagoApiClient.WalletUpdateInputWalletRecurringTransactionRulesTransactionMetadata.t()
            ]
            | nil,
          trigger: String.t() | nil
        }

  defstruct [
    :__info__,
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
        {LagoApiClient.WalletUpdateInputWalletRecurringTransactionRulesTransactionMetadata, :t}
      ],
      trigger: {:enum, ["interval", "threshold"]}
    ]
  end
end
