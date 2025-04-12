defmodule LagoClient.PlanCreateInput do
  @moduledoc """
  Provides struct and type for a PlanCreateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, plan: LagoClient.PlanCreateInputPlan.t()}

  defstruct [:__info__, :plan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [plan: {LagoClient.PlanCreateInputPlan, :t}]
  end
end
