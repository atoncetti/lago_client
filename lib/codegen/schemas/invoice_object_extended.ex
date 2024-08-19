defmodule LagoApiClient.InvoiceObjectExtended do
  @moduledoc """
  Provides struct and type for a InvoiceObjectExtended
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_taxes: [LagoApiClient.InvoiceAppliedTaxObject.t()] | nil,
          coupons_amount_cents: integer | nil,
          credit_notes_amount_cents: integer | nil,
          credits: [LagoApiClient.CreditObject.t()] | nil,
          currency: map | nil,
          customer: map | nil,
          fees: [LagoApiClient.FeeObject.t()] | nil,
          fees_amount_cents: integer | nil,
          file_url: String.t() | nil,
          invoice_type: String.t() | nil,
          issuing_date: Date.t() | nil,
          lago_id: String.t() | nil,
          metadata: [LagoApiClient.InvoiceMetadataObject.t()] | nil,
          net_payment_term: integer | nil,
          number: String.t() | nil,
          payment_dispute_lost_at: DateTime.t() | nil,
          payment_due_date: Date.t() | nil,
          payment_overdue: boolean | nil,
          payment_status: String.t() | nil,
          prepaid_credit_amount_cents: integer | nil,
          sequential_id: integer | nil,
          status: String.t() | nil,
          sub_total_excluding_taxes_amount_cents: integer | nil,
          sub_total_including_taxes_amount_cents: integer | nil,
          subscriptions: [LagoApiClient.SubscriptionObject.t()] | nil,
          taxes_amount_cents: integer | nil,
          total_amount_cents: integer | nil,
          version_number: integer | nil
        }

  defstruct [
    :__info__,
    :applied_taxes,
    :coupons_amount_cents,
    :credit_notes_amount_cents,
    :credits,
    :currency,
    :customer,
    :fees,
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
    :subscriptions,
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
      credits: [{LagoApiClient.CreditObject, :t}],
      currency: :map,
      customer: :map,
      fees: [{LagoApiClient.FeeObject, :t}],
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
      subscriptions: [{LagoApiClient.SubscriptionObject, :t}],
      taxes_amount_cents: :integer,
      total_amount_cents: :integer,
      version_number: :integer
    ]
  end
end
