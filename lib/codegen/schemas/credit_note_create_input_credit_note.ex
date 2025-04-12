defmodule LagoClient.CreditNoteCreateInputCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteCreateInputCreditNote
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          credit_amount_cents: integer | nil,
          description: String.t() | nil,
          invoice_id: String.t(),
          items: [LagoClient.CreditNoteCreateInputCreditNoteItems.t()],
          reason: String.t() | nil,
          refund_amount_cents: integer | nil
        }

  defstruct [
    :__info__,
    :credit_amount_cents,
    :description,
    :invoice_id,
    :items,
    :reason,
    :refund_amount_cents
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      credit_amount_cents: {:union, [:integer, :null]},
      description: {:string, :generic},
      invoice_id: {:string, :uuid},
      items: [{LagoClient.CreditNoteCreateInputCreditNoteItems, :t}],
      reason:
        {:enum,
         [
           "duplicated_charge",
           "product_unsatisfactory",
           "order_change",
           "order_cancellation",
           "fraudulent_charge",
           "other",
           nil
         ]},
      refund_amount_cents: {:union, [:integer, :null]}
    ]
  end
end
