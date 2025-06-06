defmodule LagoClient.OverdueBalances do
  @moduledoc """
  Provides struct and type for a OverdueBalances
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, overdue_balances: [LagoClient.OverdueBalanceObject.t()]}

  defstruct [:__info__, :overdue_balances]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [overdue_balances: [{LagoClient.OverdueBalanceObject, :t}]]
  end
end
