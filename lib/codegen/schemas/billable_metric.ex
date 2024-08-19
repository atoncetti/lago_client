defmodule LagoApiClient.BillableMetric do
  @moduledoc """
  Provides struct and type for a BillableMetric
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, billable_metric: LagoApiClient.BillableMetricObject.t()}

  defstruct [:__info__, :billable_metric]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable_metric: {LagoApiClient.BillableMetricObject, :t}]
  end
end
