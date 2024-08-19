defmodule LagoApiClient.PlanCreateInputPlan do
  @moduledoc """
  Provides struct and type for a PlanCreateInputPlan
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: LagoApiClient.PlanCreateInputPlanAmountCurrency.t() | nil,
          bill_charges_monthly: boolean | nil,
          charges: [LagoApiClient.PlanCreateInputPlanCharges.t()] | nil,
          code: String.t() | nil,
          description: String.t() | nil,
          interval: String.t() | nil,
          invoice_display_name: String.t() | nil,
          minimum_commitment: LagoApiClient.MinimumCommitmentInput.t() | nil,
          name: String.t() | nil,
          pay_in_advance: boolean | nil,
          tax_codes: [String.t()] | nil,
          trial_period: number | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :bill_charges_monthly,
    :charges,
    :code,
    :description,
    :interval,
    :invoice_display_name,
    :minimum_commitment,
    :name,
    :pay_in_advance,
    :tax_codes,
    :trial_period
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {LagoApiClient.PlanCreateInputPlanAmountCurrency, :t},
      bill_charges_monthly: :boolean,
      charges: [{LagoApiClient.PlanCreateInputPlanCharges, :t}],
      code: {:string, :generic},
      description: {:string, :generic},
      interval: {:enum, ["weekly", "monthly", "quarterly", "yearly"]},
      invoice_display_name: {:string, :generic},
      minimum_commitment: {LagoApiClient.MinimumCommitmentInput, :t},
      name: {:string, :generic},
      pay_in_advance: :boolean,
      tax_codes: [string: :generic],
      trial_period: :number
    ]
  end
end
