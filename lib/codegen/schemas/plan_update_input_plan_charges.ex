defmodule LagoClient.PlanUpdateInputPlanCharges do
  @moduledoc """
  Provides struct and type for a PlanUpdateInputPlanCharges
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable_metric_id: String.t() | nil,
          charge_model: String.t() | nil,
          filters: [LagoClient.ChargeFilterInput.t()] | nil,
          id: String.t() | nil,
          invoice_display_name: String.t() | nil,
          invoiceable: boolean | nil,
          min_amount_cents: integer | nil,
          pay_in_advance: boolean | nil,
          properties: LagoClient.ChargeProperties.t() | nil,
          prorated: boolean | nil,
          regroup_paid_fees: String.t() | nil,
          tax_codes: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :billable_metric_id,
    :charge_model,
    :filters,
    :id,
    :invoice_display_name,
    :invoiceable,
    :min_amount_cents,
    :pay_in_advance,
    :properties,
    :prorated,
    :regroup_paid_fees,
    :tax_codes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metric_id: {:string, :uuid},
      charge_model:
        {:enum,
         [
           "standard",
           "graduated",
           "graduated_percentage",
           "package",
           "percentage",
           "volume",
           "dynamic"
         ]},
      filters: [{LagoClient.ChargeFilterInput, :t}],
      id: {:string, :uuid},
      invoice_display_name: {:string, :generic},
      invoiceable: :boolean,
      min_amount_cents: :integer,
      pay_in_advance: :boolean,
      properties: {LagoClient.ChargeProperties, :t},
      prorated: :boolean,
      regroup_paid_fees: {:enum, [nil, "invoice"]},
      tax_codes: [string: :generic]
    ]
  end
end
