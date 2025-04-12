defmodule LagoClient.WalletsPaginated do
  @moduledoc """
  Provides struct and type for a WalletsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          wallets: [LagoClient.WalletObject.t()]
        }

  defstruct [:__info__, :meta, :wallets]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoClient.PaginationMeta, :t}, wallets: [{LagoClient.WalletObject, :t}]]
  end
end
