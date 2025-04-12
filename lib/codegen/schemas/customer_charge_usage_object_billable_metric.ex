defmodule LagoClient.CustomerChargeUsageObjectBillableMetric do
  @moduledoc """
  Provides struct and type for a CustomerChargeUsageObjectBillableMetric
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          aggregation_type: String.t(),
          code: String.t(),
          lago_id: String.t(),
          name: String.t()
        }

  defstruct [:__info__, :aggregation_type, :code, :lago_id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aggregation_type:
        {:enum,
         ["count_agg", "sum_agg", "max_agg", "unique_count_agg", "weighted_sum_agg", "latest_agg"]},
      code: {:string, :generic},
      lago_id: {:string, :uuid},
      name: {:string, :generic}
    ]
  end
end
