defmodule LagoClient.Plan do
  @moduledoc """
  Provides struct and type for a Plan
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, plan: LagoClient.PlanObject.t()}

  defstruct [:__info__, :plan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [plan: {LagoClient.PlanObject, :t}]
  end
end
