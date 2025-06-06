defmodule LagoClient.PlanOverridesObjectCharges do
  @moduledoc """
  Provides struct and type for a PlanOverridesObjectCharges
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable_metric_id: String.t() | nil,
          filters: [LagoClient.ChargeFilterInput.t()] | nil,
          id: String.t() | nil,
          invoice_display_name: String.t() | nil,
          min_amount_cents: integer | nil,
          properties: LagoClient.ChargeProperties.t() | nil,
          tax_codes: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :billable_metric_id,
    :filters,
    :id,
    :invoice_display_name,
    :min_amount_cents,
    :properties,
    :tax_codes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metric_id: {:string, :uuid},
      filters: [{LagoClient.ChargeFilterInput, :t}],
      id: {:string, :uuid},
      invoice_display_name: {:string, :generic},
      min_amount_cents: :integer,
      properties: {LagoClient.ChargeProperties, :t},
      tax_codes: [string: :generic]
    ]
  end
end
