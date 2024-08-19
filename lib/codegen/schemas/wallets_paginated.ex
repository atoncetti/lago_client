defmodule LagoApiClient.WalletsPaginated do
  @moduledoc """
  Provides struct and type for a WalletsPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoApiClient.PaginationMeta.t(),
          wallets: [LagoApiClient.WalletObject.t()]
        }

  defstruct [:__info__, :meta, :wallets]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoApiClient.PaginationMeta, :t}, wallets: [{LagoApiClient.WalletObject, :t}]]
  end
end
