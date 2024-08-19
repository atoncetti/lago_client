defmodule LagoApiClient.CustomerChargeUsageObject do
  @moduledoc """
  Provides struct and type for a CustomerChargeUsageObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          amount_currency: LagoApiClient.CustomerChargeUsageObjectAmountCurrency.t(),
          billable_metric: LagoApiClient.CustomerChargeUsageObjectBillableMetric.t(),
          charge: LagoApiClient.CustomerChargeUsageObjectCharge.t(),
          events_count: integer,
          filters: [LagoApiClient.CustomerChargeFiltersUsageObject.t()] | nil,
          grouped_usage: [LagoApiClient.CustomerChargeGroupedUsageObject.t()] | nil,
          units: String.t()
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :billable_metric,
    :charge,
    :events_count,
    :filters,
    :grouped_usage,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {LagoApiClient.CustomerChargeUsageObjectAmountCurrency, :t},
      billable_metric: {LagoApiClient.CustomerChargeUsageObjectBillableMetric, :t},
      charge: {LagoApiClient.CustomerChargeUsageObjectCharge, :t},
      events_count: :integer,
      filters: [{LagoApiClient.CustomerChargeFiltersUsageObject, :t}],
      grouped_usage: [{LagoApiClient.CustomerChargeGroupedUsageObject, :t}],
      units: {:string, :generic}
    ]
  end
end
