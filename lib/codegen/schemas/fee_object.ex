defmodule LagoApiClient.FeeObject do
  @moduledoc """
  Provides struct and type for a FeeObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          amount_currency: map,
          amount_details: map | nil,
          applied_taxes: [LagoApiClient.FeeAppliedTaxObject.t()] | nil,
          created_at: DateTime.t() | nil,
          event_transaction_id: String.t() | nil,
          events_count: integer | nil,
          external_customer_id: String.t() | nil,
          external_subscription_id: String.t() | nil,
          failed_at: DateTime.t() | nil,
          from_date: DateTime.t() | nil,
          invoice_display_name: String.t() | nil,
          invoiceable: boolean,
          item: map,
          lago_charge_filter_id: String.t() | nil,
          lago_customer_id: String.t() | nil,
          lago_id: String.t() | nil,
          lago_invoice_id: String.t() | nil,
          lago_subscription_id: String.t() | nil,
          lago_true_up_fee_id: String.t() | nil,
          lago_true_up_parent_fee_id: String.t() | nil,
          pay_in_advance: boolean,
          payment_status: String.t(),
          precise_unit_amount: String.t(),
          refunded_at: DateTime.t() | nil,
          succeeded_at: DateTime.t() | nil,
          taxes_amount_cents: integer,
          taxes_rate: number,
          to_date: DateTime.t() | nil,
          total_amount_cents: integer,
          total_amount_currency: map,
          units: String.t()
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :amount_details,
    :applied_taxes,
    :created_at,
    :event_transaction_id,
    :events_count,
    :external_customer_id,
    :external_subscription_id,
    :failed_at,
    :from_date,
    :invoice_display_name,
    :invoiceable,
    :item,
    :lago_charge_filter_id,
    :lago_customer_id,
    :lago_id,
    :lago_invoice_id,
    :lago_subscription_id,
    :lago_true_up_fee_id,
    :lago_true_up_parent_fee_id,
    :pay_in_advance,
    :payment_status,
    :precise_unit_amount,
    :refunded_at,
    :succeeded_at,
    :taxes_amount_cents,
    :taxes_rate,
    :to_date,
    :total_amount_cents,
    :total_amount_currency,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: :map,
      amount_details: :map,
      applied_taxes: [{LagoApiClient.FeeAppliedTaxObject, :t}],
      created_at: {:string, :date_time},
      event_transaction_id: {:string, :generic},
      events_count: :integer,
      external_customer_id: {:string, :generic},
      external_subscription_id: {:string, :generic},
      failed_at: {:string, :date_time},
      from_date: {:string, :date_time},
      invoice_display_name: {:string, :generic},
      invoiceable: :boolean,
      item: :map,
      lago_charge_filter_id: {:string, :uuid},
      lago_customer_id: {:string, :uuid},
      lago_id: {:string, :uuid},
      lago_invoice_id: {:string, :uuid},
      lago_subscription_id: {:string, :uuid},
      lago_true_up_fee_id: {:string, :uuid},
      lago_true_up_parent_fee_id: {:string, :uuid},
      pay_in_advance: :boolean,
      payment_status: {:enum, ["pending", "succeeded", "failed", "refunded"]},
      precise_unit_amount: {:string, :generic},
      refunded_at: {:string, :date_time},
      succeeded_at: {:string, :date_time},
      taxes_amount_cents: :integer,
      taxes_rate: :number,
      to_date: {:string, :date_time},
      total_amount_cents: :integer,
      total_amount_currency: :map,
      units: {:string, :generic}
    ]
  end
end
