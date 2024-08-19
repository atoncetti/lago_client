defmodule LagoApiClient.BillableMetricsPaginated do
  @moduledoc """
  Provides struct and type for a BillableMetricsPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable_metrics: [LagoApiClient.BillableMetricObject.t()],
          meta: LagoApiClient.PaginationMeta.t()
        }

  defstruct [:__info__, :billable_metrics, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metrics: [{LagoApiClient.BillableMetricObject, :t}],
      meta: {LagoApiClient.PaginationMeta, :t}
    ]
  end
end
