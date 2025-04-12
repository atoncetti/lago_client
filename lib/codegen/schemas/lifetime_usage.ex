defmodule LagoClient.LifetimeUsage do
  @moduledoc """
  Provides struct and type for a LifetimeUsage
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, lifetime_usage: LagoClient.LifetimeUsageObject.t()}

  defstruct [:__info__, :lifetime_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [lifetime_usage: {LagoClient.LifetimeUsageObject, :t}]
  end
end
