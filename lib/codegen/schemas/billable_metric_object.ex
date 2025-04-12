defmodule LagoClient.BillableMetricObject do
  @moduledoc """
  Provides struct and type for a BillableMetricObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          aggregation_type: String.t(),
          code: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          expression: String.t() | nil,
          field_name: String.t() | nil,
          filters: [LagoClient.BillableMetricFilterObject.t()] | nil,
          lago_id: String.t(),
          name: String.t(),
          recurring: boolean,
          rounding_function: String.t() | nil,
          rounding_precision: integer | nil,
          weighted_interval: String.t() | nil
        }

  defstruct [
    :__info__,
    :aggregation_type,
    :code,
    :created_at,
    :description,
    :expression,
    :field_name,
    :filters,
    :lago_id,
    :name,
    :recurring,
    :rounding_function,
    :rounding_precision,
    :weighted_interval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation_type:
        {:enum,
         ["count_agg", "sum_agg", "max_agg", "unique_count_agg", "weighted_sum_agg", "latest_agg"]},
      code: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:union, [{:string, :generic}, :null]},
      expression: {:string, :generic},
      field_name: {:union, [{:string, :generic}, :null]},
      filters: [{LagoClient.BillableMetricFilterObject, :t}],
      lago_id: {:string, :uuid},
      name: {:string, :generic},
      recurring: :boolean,
      rounding_function: {:enum, ["ceil", "floor", "round", nil]},
      rounding_precision: {:union, [:integer, :null]},
      weighted_interval: {:enum, ["seconds", nil]}
    ]
  end
end
