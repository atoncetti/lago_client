defmodule LagoClient.WalletTransactionCreateInput do
  @moduledoc """
  Provides struct and type for a WalletTransactionCreateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          wallet_transaction: LagoClient.WalletTransactionCreateInputWalletTransaction.t()
        }

  defstruct [:__info__, :wallet_transaction]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet_transaction: {LagoClient.WalletTransactionCreateInputWalletTransaction, :t}]
  end
end
