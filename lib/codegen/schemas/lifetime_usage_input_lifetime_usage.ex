defmodule LagoClient.LifetimeUsageInputLifetimeUsage do
  @moduledoc """
  Provides struct and type for a LifetimeUsageInputLifetimeUsage
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, external_historical_usage_amount_cents: integer}

  defstruct [:__info__, :external_historical_usage_amount_cents]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [external_historical_usage_amount_cents: :integer]
  end
end
