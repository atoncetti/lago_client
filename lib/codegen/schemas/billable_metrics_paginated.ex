defmodule LagoClient.BillableMetricsPaginated do
  @moduledoc """
  Provides struct and type for a BillableMetricsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable_metrics: [LagoClient.BillableMetricObject.t()],
          meta: LagoClient.PaginationMeta.t()
        }

  defstruct [:__info__, :billable_metrics, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metrics: [{LagoClient.BillableMetricObject, :t}],
      meta: {LagoClient.PaginationMeta, :t}
    ]
  end
end
