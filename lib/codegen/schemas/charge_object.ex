defmodule LagoClient.ChargeObject do
  @moduledoc """
  Provides struct and type for a ChargeObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable_metric_code: String.t(),
          charge_model: String.t(),
          created_at: DateTime.t(),
          filters: [LagoClient.ChargeFilterObject.t()] | nil,
          invoice_display_name: String.t() | nil,
          invoiceable: boolean | nil,
          lago_billable_metric_id: String.t(),
          lago_id: String.t(),
          min_amount_cents: integer | nil,
          pay_in_advance: boolean | nil,
          properties: LagoClient.ChargeProperties.t() | nil,
          prorated: boolean | nil,
          regroup_paid_fees: String.t() | nil,
          taxes: [LagoClient.TaxObject.t()] | nil
        }

  defstruct [
    :__info__,
    :billable_metric_code,
    :charge_model,
    :created_at,
    :filters,
    :invoice_display_name,
    :invoiceable,
    :lago_billable_metric_id,
    :lago_id,
    :min_amount_cents,
    :pay_in_advance,
    :properties,
    :prorated,
    :regroup_paid_fees,
    :taxes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metric_code: {:string, :generic},
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
      created_at: {:string, :date_time},
      filters: [{LagoClient.ChargeFilterObject, :t}],
      invoice_display_name: {:string, :generic},
      invoiceable: :boolean,
      lago_billable_metric_id: {:string, :uuid},
      lago_id: {:string, :uuid},
      min_amount_cents: :integer,
      pay_in_advance: :boolean,
      properties: {LagoClient.ChargeProperties, :t},
      prorated: :boolean,
      regroup_paid_fees: {:enum, [nil, "invoice"]},
      taxes: [{LagoClient.TaxObject, :t}]
    ]
  end
end
