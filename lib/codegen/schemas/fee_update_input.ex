defmodule LagoClient.FeeUpdateInput do
  @moduledoc """
  Provides struct and type for a FeeUpdateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, fee: LagoClient.FeeUpdateInputFee.t()}

  defstruct [:__info__, :fee]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fee: {LagoClient.FeeUpdateInputFee, :t}]
  end
end
