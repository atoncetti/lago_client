defmodule LagoClient.Wallet do
  @moduledoc """
  Provides struct and type for a Wallet
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, wallet: LagoClient.WalletObject.t()}

  defstruct [:__info__, :wallet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet: {LagoClient.WalletObject, :t}]
  end
end
