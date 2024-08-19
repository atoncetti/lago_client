defmodule LagoApiClient.PlanOverridesObject do
  @moduledoc """
  Provides struct and type for a PlanOverridesObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: LagoApiClient.PlanOverridesObjectAmountCurrency.t() | nil,
          charges: [LagoApiClient.PlanOverridesObjectCharges.t()] | nil,
          description: String.t() | nil,
          invoice_display_name: String.t() | nil,
          minimum_commitment: LagoApiClient.MinimumCommitmentObject.t() | nil,
          name: String.t() | nil,
          tax_codes: [String.t()] | nil,
          trial_period: number | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :charges,
    :description,
    :invoice_display_name,
    :minimum_commitment,
    :name,
    :tax_codes,
    :trial_period
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {LagoApiClient.PlanOverridesObjectAmountCurrency, :t},
      charges: [{LagoApiClient.PlanOverridesObjectCharges, :t}],
      description: {:string, :generic},
      invoice_display_name: {:string, :generic},
      minimum_commitment: {LagoApiClient.MinimumCommitmentObject, :t},
      name: {:string, :generic},
      tax_codes: [string: :generic],
      trial_period: :number
    ]
  end
end
