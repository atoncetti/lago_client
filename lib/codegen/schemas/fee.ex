defmodule LagoClient.Fee do
  @moduledoc """
  Provides struct and type for a Fee
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, fee: LagoClient.FeeObject.t()}

  defstruct [:__info__, :fee]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fee: {LagoClient.FeeObject, :t}]
  end
end
