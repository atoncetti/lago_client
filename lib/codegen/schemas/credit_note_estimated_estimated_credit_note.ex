defmodule LagoApiClient.CreditNoteEstimatedEstimatedCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimatedEstimatedCreditNote
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_taxes:
            [LagoApiClient.CreditNoteEstimatedEstimatedCreditNoteAppliedTaxes.t()] | nil,
          coupons_adjustment_amount_cents: integer,
          currency: LagoApiClient.CreditNoteEstimatedEstimatedCreditNoteCurrency.t(),
          invoice_number: String.t(),
          items: [LagoApiClient.CreditNoteEstimatedEstimatedCreditNoteItems.t()],
          lago_invoice_id: String.t(),
          max_creditable_amount_cents: integer,
          max_refundable_amount_cents: integer,
          sub_total_excluding_taxes_amount_cents: integer,
          taxes_amount_cents: integer,
          taxes_rate: number
        }

  defstruct [
    :__info__,
    :applied_taxes,
    :coupons_adjustment_amount_cents,
    :currency,
    :invoice_number,
    :items,
    :lago_invoice_id,
    :max_creditable_amount_cents,
    :max_refundable_amount_cents,
    :sub_total_excluding_taxes_amount_cents,
    :taxes_amount_cents,
    :taxes_rate
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_taxes: [{LagoApiClient.CreditNoteEstimatedEstimatedCreditNoteAppliedTaxes, :t}],
      coupons_adjustment_amount_cents: :integer,
      currency: {LagoApiClient.CreditNoteEstimatedEstimatedCreditNoteCurrency, :t},
      invoice_number: {:string, :generic},
      items: [{LagoApiClient.CreditNoteEstimatedEstimatedCreditNoteItems, :t}],
      lago_invoice_id: {:string, :uuid},
      max_creditable_amount_cents: :integer,
      max_refundable_amount_cents: :integer,
      sub_total_excluding_taxes_amount_cents: :integer,
      taxes_amount_cents: :integer,
      taxes_rate: :number
    ]
  end
end
