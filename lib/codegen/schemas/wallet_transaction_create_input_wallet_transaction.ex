defmodule LagoClient.WalletTransactionCreateInputWalletTransaction do
  @moduledoc """
  Provides struct and type for a WalletTransactionCreateInputWalletTransaction
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          granted_credits: String.t() | nil,
          invoice_requires_successful_payment: boolean | nil,
          metadata: [LagoClient.WalletTransactionCreateInputWalletTransactionMetadata.t()] | nil,
          paid_credits: String.t() | nil,
          voided_credits: String.t() | nil,
          wallet_id: String.t()
        }

  defstruct [
    :__info__,
    :granted_credits,
    :invoice_requires_successful_payment,
    :metadata,
    :paid_credits,
    :voided_credits,
    :wallet_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      granted_credits: {:string, :generic},
      invoice_requires_successful_payment: :boolean,
      metadata: [{LagoClient.WalletTransactionCreateInputWalletTransactionMetadata, :t}],
      paid_credits: {:string, :generic},
      voided_credits: {:string, :generic},
      wallet_id: {:string, :uuid}
    ]
  end
end
