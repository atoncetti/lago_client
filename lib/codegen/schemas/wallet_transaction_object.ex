defmodule LagoApiClient.WalletTransactionObject do
  @moduledoc """
  Provides struct and type for a WalletTransactionObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount: String.t(),
          created_at: DateTime.t(),
          credit_amount: String.t(),
          invoice_requires_successful_payment: boolean | nil,
          lago_id: String.t(),
          lago_wallet_id: String.t(),
          metadata: [LagoApiClient.WalletTransactionObjectMetadata.t()] | nil,
          settled_at: DateTime.t() | nil,
          source: String.t() | nil,
          status: String.t(),
          transaction_status: String.t(),
          transaction_type: String.t()
        }

  defstruct [
    :__info__,
    :amount,
    :created_at,
    :credit_amount,
    :invoice_requires_successful_payment,
    :lago_id,
    :lago_wallet_id,
    :metadata,
    :settled_at,
    :source,
    :status,
    :transaction_status,
    :transaction_type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {:string, :generic},
      created_at: {:string, :date_time},
      credit_amount: {:string, :generic},
      invoice_requires_successful_payment: :boolean,
      lago_id: {:string, :uuid},
      lago_wallet_id: {:string, :uuid},
      metadata: [{LagoApiClient.WalletTransactionObjectMetadata, :t}],
      settled_at: {:string, :date_time},
      source: {:enum, ["manual", "interval", "threshold"]},
      status: {:enum, ["pending", "settled"]},
      transaction_status: {:enum, ["purchased", "granted", "voided", "invoiced"]},
      transaction_type: {:enum, ["inbound", "outbound"]}
    ]
  end
end
