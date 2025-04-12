defmodule LagoClient.LifetimeUsageInput do
  @moduledoc """
  Provides struct and type for a LifetimeUsageInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          lifetime_usage: LagoClient.LifetimeUsageInputLifetimeUsage.t()
        }

  defstruct [:__info__, :lifetime_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [lifetime_usage: {LagoClient.LifetimeUsageInputLifetimeUsage, :t}]
  end
end
