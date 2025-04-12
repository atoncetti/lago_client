defmodule LagoClient.EventInputObject do
  @moduledoc """
  Provides struct and type for a EventInputObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code: String.t(),
          external_subscription_id: String.t(),
          precise_total_amount_cents: String.t() | nil,
          properties: LagoClient.EventInputObjectProperties.t() | nil,
          timestamp: integer | String.t() | nil,
          transaction_id: String.t()
        }

  defstruct [
    :__info__,
    :code,
    :external_subscription_id,
    :precise_total_amount_cents,
    :properties,
    :timestamp,
    :transaction_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      external_subscription_id: {:string, :generic},
      precise_total_amount_cents: {:union, [{:string, :generic}, :null]},
      properties: {LagoClient.EventInputObjectProperties, :t},
      timestamp: {:union, [:integer, string: :generic]},
      transaction_id: {:string, :generic}
    ]
  end
end
