defmodule LagoApiClient.BillableMetricCreateInput do
  @moduledoc """
  Provides struct and type for a BillableMetricCreateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable_metric: LagoApiClient.BillableMetricCreateInputBillableMetric.t()
        }

  defstruct [:__info__, :billable_metric]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable_metric: {LagoApiClient.BillableMetricCreateInputBillableMetric, :t}]
  end
end
