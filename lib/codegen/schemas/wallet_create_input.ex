defmodule LagoClient.WalletCreateInput do
  @moduledoc """
  Provides struct and type for a WalletCreateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, wallet: LagoClient.WalletCreateInputWallet.t() | nil}

  defstruct [:__info__, :wallet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet: {LagoClient.WalletCreateInputWallet, :t}]
  end
end
