defmodule LagoClient.TaxCreateInput do
  @moduledoc """
  Provides struct and type for a TaxCreateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, tax: LagoClient.TaxBaseInput.t()}

  defstruct [:__info__, :tax]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tax: {LagoClient.TaxBaseInput, :t}]
  end
end
