defmodule LagoApiClient.WalletUpdateInput do
  @moduledoc """
  Provides struct and type for a WalletUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, wallet: LagoApiClient.WalletUpdateInputWallet.t()}

  defstruct [:__info__, :wallet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wallet: {LagoApiClient.WalletUpdateInputWallet, :t}]
  end
end
