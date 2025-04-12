defmodule LagoClient.BillableMetricEvaluateExpressionInputEvent do
  @moduledoc """
  Provides struct and type for a BillableMetricEvaluateExpressionInputEvent
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code: String.t(),
          properties: LagoClient.BillableMetricEvaluateExpressionInputEventProperties.t(),
          timestamp: integer | String.t() | nil
        }

  defstruct [:__info__, :code, :properties, :timestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      properties: {LagoClient.BillableMetricEvaluateExpressionInputEventProperties, :t},
      timestamp: {:union, [:integer, string: :generic]}
    ]
  end
end
