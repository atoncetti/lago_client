defmodule LagoApiClient.PlanUpdateInput do
  @moduledoc """
  Provides struct and type for a PlanUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, plan: LagoApiClient.PlanUpdateInputPlan.t()}

  defstruct [:__info__, :plan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [plan: {LagoApiClient.PlanUpdateInputPlan, :t}]
  end
end
