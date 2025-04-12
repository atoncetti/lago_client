defmodule LagoClient.LifetimeUsageThresholdObject do
  @moduledoc """
  Provides struct and type for a LifetimeUsageThresholdObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          completion_ratio: number,
          reached_at: DateTime.t() | nil
        }

  defstruct [:__info__, :amount_cents, :completion_ratio, :reached_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      completion_ratio: :number,
      reached_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
