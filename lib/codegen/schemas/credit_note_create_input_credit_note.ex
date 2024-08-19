defmodule LagoApiClient.CreditNoteCreateInputCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteCreateInputCreditNote
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          credit_amount_cents: integer | nil,
          description: String.t() | nil,
          invoice_id: String.t(),
          items: [LagoApiClient.CreditNoteCreateInputCreditNoteItems.t()],
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
      credit_amount_cents: :integer,
      description: {:string, :generic},
      invoice_id: {:string, :uuid},
      items: [{LagoApiClient.CreditNoteCreateInputCreditNoteItems, :t}],
      reason:
        {:enum,
         [
           "duplicated_charge",
           "product_unsatisfactory",
           "order_change",
           "order_cancellation",
           "fraudulent_charge",
           "other"
         ]},
      refund_amount_cents: :integer
    ]
  end
end
