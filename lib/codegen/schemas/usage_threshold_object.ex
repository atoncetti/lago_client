defmodule LagoClient.UsageThresholdObject do
  @moduledoc """
  Provides struct and type for a UsageThresholdObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          created_at: DateTime.t(),
          lago_id: String.t(),
          recurring: boolean,
          threshold_display_name: String.t() | nil,
          updated_at: DateTime.t()
        }

  defstruct [
    :__info__,
    :amount_cents,
    :created_at,
    :lago_id,
    :recurring,
    :threshold_display_name,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      created_at: {:string, :date_time},
      lago_id: {:string, :uuid},
      recurring: :boolean,
      threshold_display_name: {:union, [{:string, :generic}, :null]},
      updated_at: {:string, :date_time}
    ]
  end
end
