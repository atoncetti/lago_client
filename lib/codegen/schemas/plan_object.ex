defmodule LagoApiClient.PlanObject do
  @moduledoc """
  Provides struct and type for a PlanObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          active_subscriptions_count: integer,
          amount_cents: integer,
          amount_currency: LagoApiClient.PlanObjectAmountCurrency.t(),
          bill_charges_monthly: boolean | nil,
          charges: [LagoApiClient.ChargeObject.t()] | nil,
          code: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          draft_invoices_count: integer,
          interval: String.t(),
          invoice_display_name: String.t() | nil,
          lago_id: String.t(),
          minimum_commitment: LagoApiClient.MinimumCommitmentObject.t() | nil,
          name: String.t(),
          pay_in_advance: boolean | nil,
          taxes: [LagoApiClient.TaxObject.t()] | nil,
          trial_period: number | nil
        }

  defstruct [
    :__info__,
    :active_subscriptions_count,
    :amount_cents,
    :amount_currency,
    :bill_charges_monthly,
    :charges,
    :code,
    :created_at,
    :description,
    :draft_invoices_count,
    :interval,
    :invoice_display_name,
    :lago_id,
    :minimum_commitment,
    :name,
    :pay_in_advance,
    :taxes,
    :trial_period
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_subscriptions_count: :integer,
      amount_cents: :integer,
      amount_currency: {LagoApiClient.PlanObjectAmountCurrency, :t},
      bill_charges_monthly: :boolean,
      charges: [{LagoApiClient.ChargeObject, :t}],
      code: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:string, :generic},
      draft_invoices_count: :integer,
      interval: {:enum, ["weekly", "monthly", "quarterly", "yearly"]},
      invoice_display_name: {:string, :generic},
      lago_id: {:string, :uuid},
      minimum_commitment: {LagoApiClient.MinimumCommitmentObject, :t},
      name: {:string, :generic},
      pay_in_advance: :boolean,
      taxes: [{LagoApiClient.TaxObject, :t}],
      trial_period: :number
    ]
  end
end
