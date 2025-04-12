defmodule LagoClient.PaymentManualObject do
  @moduledoc """
  Provides struct and type for a PaymentManualObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: String.t() | nil,
          created_at: DateTime.t() | nil,
          external_payment_id: String.t() | nil,
          invoice_ids: [String.t()] | nil,
          lago_id: String.t() | nil,
          payment_status: String.t() | nil,
          reference: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :created_at,
    :external_payment_id,
    :invoice_ids,
    :lago_id,
    :payment_status,
    :reference,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {:string, :generic},
      created_at: {:string, :date_time},
      external_payment_id: {:union, [{:string, :generic}, :null]},
      invoice_ids: [string: :uuid],
      lago_id: {:string, :uuid},
      payment_status: {:string, :generic},
      reference: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end
