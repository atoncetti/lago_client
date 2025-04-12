defmodule LagoClient.WalletTransactions do
  @moduledoc """
  Provides struct and type for a WalletTransactions
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          wallet_transactions: [LagoClient.WalletTransactionObject.t()]
        }

  defstruct [:__info__, :wallet_transactions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet_transactions: [{LagoClient.WalletTransactionObject, :t}]]
  end
end
