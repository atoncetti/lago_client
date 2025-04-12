defmodule LagoClient.UsageThresholdInput do
  @moduledoc """
  Provides struct and type for a UsageThresholdInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          id: String.t() | nil,
          recurring: boolean,
          threshold_display_name: String.t() | nil
        }

  defstruct [:__info__, :amount_cents, :id, :recurring, :threshold_display_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      id: {:union, [{:string, :uuid}, :null]},
      recurring: :boolean,
      threshold_display_name: {:union, [{:string, :generic}, :null]}
    ]
  end
end
