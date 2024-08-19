defmodule LagoApiClient.WalletTransactions do
  @moduledoc """
  Provides struct and type for a WalletTransactions
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          wallet_transactions: [LagoApiClient.WalletTransactionObject.t()]
        }

  defstruct [:__info__, :wallet_transactions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet_transactions: [{LagoApiClient.WalletTransactionObject, :t}]]
  end
end
