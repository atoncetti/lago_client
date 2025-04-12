defmodule LagoClient.WalletUpdateInputWalletRecurringTransactionRulesTransactionMetadata do
  @moduledoc """
  Provides struct and type for a WalletUpdateInputWalletRecurringTransactionRulesTransactionMetadata
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, key: String.t() | nil, value: String.t() | nil}

  defstruct [:__info__, :key, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [key: {:string, :generic}, value: {:string, :generic}]
  end
end
