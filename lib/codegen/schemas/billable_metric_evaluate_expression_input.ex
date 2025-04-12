defmodule LagoClient.BillableMetricEvaluateExpressionInput do
  @moduledoc """
  Provides struct and type for a BillableMetricEvaluateExpressionInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          event: LagoClient.BillableMetricEvaluateExpressionInputEvent.t(),
          expression: String.t()
        }

  defstruct [:__info__, :event, :expression]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      event: {LagoClient.BillableMetricEvaluateExpressionInputEvent, :t},
      expression: {:string, :generic}
    ]
  end
end
