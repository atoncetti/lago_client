defmodule LagoApiClient.PlanCreateInput do
  @moduledoc """
  Provides struct and type for a PlanCreateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, plan: LagoApiClient.PlanCreateInputPlan.t()}

  defstruct [:__info__, :plan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [plan: {LagoApiClient.PlanCreateInputPlan, :t}]
  end
end
