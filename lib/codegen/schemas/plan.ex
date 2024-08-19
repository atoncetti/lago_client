defmodule LagoApiClient.Plan do
  @moduledoc """
  Provides struct and type for a Plan
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, plan: LagoApiClient.PlanObject.t()}

  defstruct [:__info__, :plan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [plan: {LagoApiClient.PlanObject, :t}]
  end
end
