defmodule LagoClient.BillableMetricFilterObject do
  @moduledoc """
  Provides struct and type for a BillableMetricFilterObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, key: String.t(), values: [String.t()]}

  defstruct [:__info__, :key, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [key: {:string, :generic}, values: [string: :generic]]
  end
end
