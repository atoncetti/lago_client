defmodule LagoApiClient.WalletTransactionsPaginated do
  @moduledoc """
  Provides struct and type for a WalletTransactionsPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoApiClient.PaginationMeta.t() | nil,
          wallet_transactions: [LagoApiClient.WalletTransactionObject.t()] | nil
        }

  defstruct [:__info__, :meta, :wallet_transactions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {LagoApiClient.PaginationMeta, :t},
      wallet_transactions: [{LagoApiClient.WalletTransactionObject, :t}]
    ]
  end
end
