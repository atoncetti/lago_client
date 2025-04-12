defmodule LagoClient.Tax do
  @moduledoc """
  Provides struct and type for a Tax
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, tax: LagoClient.TaxObject.t()}

  defstruct [:__info__, :tax]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tax: {LagoClient.TaxObject, :t}]
  end
end
