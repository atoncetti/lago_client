defmodule LagoClient.EventObject do
  @moduledoc """
  Provides struct and type for a EventObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code: String.t(),
          created_at: DateTime.t(),
          external_subscription_id: String.t(),
          lago_customer_id: String.t() | nil,
          lago_id: String.t(),
          lago_subscription_id: String.t() | nil,
          precise_total_amount_cents: String.t() | nil,
          properties: LagoClient.EventObjectProperties.t() | nil,
          timestamp: DateTime.t(),
          transaction_id: String.t()
        }

  defstruct [
    :__info__,
    :code,
    :created_at,
    :external_subscription_id,
    :lago_customer_id,
    :lago_id,
    :lago_subscription_id,
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
      created_at: {:string, :date_time},
      external_subscription_id: {:string, :generic},
      lago_customer_id: {:union, [{:string, :uuid}, :null]},
      lago_id: {:string, :uuid},
      lago_subscription_id: {:union, [{:string, :uuid}, :null]},
      precise_total_amount_cents: {:union, [{:string, :generic}, :null]},
      properties: {LagoClient.EventObjectProperties, :t},
      timestamp: {:string, :date_time},
      transaction_id: {:string, :generic}
    ]
  end
end
