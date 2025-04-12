defmodule LagoClient.BillableMetricEvaluateExpressionResultExpressionResult do
  @moduledoc """
  Provides struct and type for a BillableMetricEvaluateExpressionResultExpressionResult
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, value: number | String.t()}

  defstruct [:__info__, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [value: {:union, [:number, string: :generic]}]
  end
end
