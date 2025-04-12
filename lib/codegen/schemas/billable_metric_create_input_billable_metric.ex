defmodule LagoClient.BillableMetricCreateInputBillableMetric do
  @moduledoc """
  Provides struct and type for a BillableMetricCreateInputBillableMetric
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          aggregation_type: String.t() | nil,
          code: String.t() | nil,
          description: String.t() | nil,
          field_name: String.t() | nil,
          filters: [LagoClient.BillableMetricFilterInput.t()] | nil,
          name: String.t() | nil,
          recurring: boolean | nil,
          weighted_interval: String.t() | nil
        }

  defstruct [
    :__info__,
    :aggregation_type,
    :code,
    :description,
    :field_name,
    :filters,
    :name,
    :recurring,
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
      description: {:string, :generic},
      field_name: {:string, :generic},
      filters: [{LagoClient.BillableMetricFilterInput, :t}],
      name: {:string, :generic},
      recurring: :boolean,
      weighted_interval: {:const, "seconds"}
    ]
  end
end
