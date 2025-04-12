defmodule LagoClient.WalletTransactionsPaginated do
  @moduledoc """
  Provides struct and type for a WalletTransactionsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t() | nil,
          wallet_transactions: [LagoClient.WalletTransactionObject.t()] | nil
        }

  defstruct [:__info__, :meta, :wallet_transactions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {LagoClient.PaginationMeta, :t},
      wallet_transactions: [{LagoClient.WalletTransactionObject, :t}]
    ]
  end
end
