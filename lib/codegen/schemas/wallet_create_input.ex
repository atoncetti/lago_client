defmodule LagoApiClient.WalletCreateInput do
  @moduledoc """
  Provides struct and type for a WalletCreateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, wallet: LagoApiClient.WalletCreateInputWallet.t() | nil}

  defstruct [:__info__, :wallet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet: {LagoApiClient.WalletCreateInputWallet, :t}]
  end
end
