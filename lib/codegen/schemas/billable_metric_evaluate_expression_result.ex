defmodule LagoClient.BillableMetricEvaluateExpressionResult do
  @moduledoc """
  Provides struct and type for a BillableMetricEvaluateExpressionResult
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          expression_result: LagoClient.BillableMetricEvaluateExpressionResultExpressionResult.t()
        }

  defstruct [:__info__, :expression_result]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expression_result: {LagoClient.BillableMetricEvaluateExpressionResultExpressionResult, :t}]
  end
end
