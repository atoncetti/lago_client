defmodule LagoClient.BillableMetricUpdateInput do
  @moduledoc """
  Provides struct and type for a BillableMetricUpdateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, billable_metric: LagoClient.BillableMetricBaseInput.t()}

  defstruct [:__info__, :billable_metric]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable_metric: {LagoClient.BillableMetricBaseInput, :t}]
  end
end
