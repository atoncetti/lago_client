defmodule LagoApiClient.CreditNoteObject do
  @moduledoc """
  Provides struct and type for a CreditNoteObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_taxes: [LagoApiClient.CreditNoteAppliedTaxObject.t()] | nil,
          balance_amount_cents: integer,
          coupons_adjustment_amount_cents: integer,
          created_at: DateTime.t(),
          credit_amount_cents: integer,
          credit_status: String.t() | nil,
          currency: LagoApiClient.CreditNoteObjectCurrency.t(),
          description: String.t() | nil,
          file_url: String.t() | nil,
          invoice_number: String.t(),
          issuing_date: Date.t(),
          items: [LagoApiClient.CreditNoteItemObject.t()] | nil,
          lago_id: String.t(),
          lago_invoice_id: String.t(),
          number: String.t(),
          reason: String.t(),
          refund_amount_cents: integer,
          refund_status: String.t() | nil,
          sequential_id: integer,
          sub_total_excluding_taxes_amount_cents: integer,
          taxes_amount_cents: integer,
          taxes_rate: number,
          total_amount_cents: integer,
          updated_at: DateTime.t()
        }

  defstruct [
    :__info__,
    :applied_taxes,
    :balance_amount_cents,
    :coupons_adjustment_amount_cents,
    :created_at,
    :credit_amount_cents,
    :credit_status,
    :currency,
    :description,
    :file_url,
    :invoice_number,
    :issuing_date,
    :items,
    :lago_id,
    :lago_invoice_id,
    :number,
    :reason,
    :refund_amount_cents,
    :refund_status,
    :sequential_id,
    :sub_total_excluding_taxes_amount_cents,
    :taxes_amount_cents,
    :taxes_rate,
    :total_amount_cents,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_taxes: [{LagoApiClient.CreditNoteAppliedTaxObject, :t}],
      balance_amount_cents: :integer,
      coupons_adjustment_amount_cents: :integer,
      created_at: {:string, :date_time},
      credit_amount_cents: :integer,
      credit_status: {:enum, ["available", "consumed", "voided"]},
      currency: {LagoApiClient.CreditNoteObjectCurrency, :t},
      description: {:string, :generic},
      file_url: {:string, :generic},
      invoice_number: {:string, :generic},
      issuing_date: {:string, :date},
      items: [{LagoApiClient.CreditNoteItemObject, :t}],
      lago_id: {:string, :uuid},
      lago_invoice_id: {:string, :uuid},
      number: {:string, :generic},
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
      refund_amount_cents: :integer,
      refund_status: {:enum, ["pending", "succeeded", "failed"]},
      sequential_id: :integer,
      sub_total_excluding_taxes_amount_cents: :integer,
      taxes_amount_cents: :integer,
      taxes_rate: :number,
      total_amount_cents: :integer,
      updated_at: {:string, :date_time}
    ]
  end
end
