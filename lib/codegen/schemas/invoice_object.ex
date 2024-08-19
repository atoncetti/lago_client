defmodule LagoApiClient.InvoiceObject do
  @moduledoc """
  Provides struct and type for a InvoiceObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_taxes: [LagoApiClient.InvoiceAppliedTaxObject.t()] | nil,
          coupons_amount_cents: integer,
          credit_notes_amount_cents: integer,
          currency: map,
          customer: map | nil,
          fees_amount_cents: integer,
          file_url: String.t() | nil,
          invoice_type: String.t(),
          issuing_date: Date.t(),
          lago_id: String.t(),
          metadata: [LagoApiClient.InvoiceMetadataObject.t()] | nil,
          net_payment_term: integer | nil,
          number: String.t(),
          payment_dispute_lost_at: DateTime.t() | nil,
          payment_due_date: Date.t() | nil,
          payment_overdue: boolean | nil,
          payment_status: String.t(),
          prepaid_credit_amount_cents: integer,
          sequential_id: integer | nil,
          status: String.t(),
          sub_total_excluding_taxes_amount_cents: integer,
          sub_total_including_taxes_amount_cents: integer,
          taxes_amount_cents: integer,
          total_amount_cents: integer,
          version_number: integer
        }

  defstruct [
    :__info__,
    :applied_taxes,
    :coupons_amount_cents,
    :credit_notes_amount_cents,
    :currency,
    :customer,
    :fees_amount_cents,
    :file_url,
    :invoice_type,
    :issuing_date,
    :lago_id,
    :metadata,
    :net_payment_term,
    :number,
    :payment_dispute_lost_at,
    :payment_due_date,
    :payment_overdue,
    :payment_status,
    :prepaid_credit_amount_cents,
    :sequential_id,
    :status,
    :sub_total_excluding_taxes_amount_cents,
    :sub_total_including_taxes_amount_cents,
    :taxes_amount_cents,
    :total_amount_cents,
    :version_number
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_taxes: [{LagoApiClient.InvoiceAppliedTaxObject, :t}],
      coupons_amount_cents: :integer,
      credit_notes_amount_cents: :integer,
      currency: :map,
      customer: :map,
      fees_amount_cents: :integer,
      file_url: {:string, :uri},
      invoice_type: {:enum, ["subscription", "add_on", "credit", "one_off"]},
      issuing_date: {:string, :date},
      lago_id: {:string, :uuid},
      metadata: [{LagoApiClient.InvoiceMetadataObject, :t}],
      net_payment_term: :integer,
      number: {:string, :generic},
      payment_dispute_lost_at: {:string, :date_time},
      payment_due_date: {:string, :date},
      payment_overdue: :boolean,
      payment_status: {:enum, ["pending", "succeeded", "failed"]},
      prepaid_credit_amount_cents: :integer,
      sequential_id: :integer,
      status: {:enum, ["draft", "finalized", "voided"]},
      sub_total_excluding_taxes_amount_cents: :integer,
      sub_total_including_taxes_amount_cents: :integer,
      taxes_amount_cents: :integer,
      total_amount_cents: :integer,
      version_number: :integer
    ]
  end
end
