defmodule LagoApiClient.BillableMetricObject do
  @moduledoc """
  Provides struct and type for a BillableMetricObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          active_subscriptions_count: integer,
          aggregation_type: String.t(),
          code: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          draft_invoices_count: integer,
          field_name: String.t() | nil,
          filters: [LagoApiClient.BillableMetricFilterObject.t()] | nil,
          lago_id: String.t(),
          name: String.t(),
          plans_count: integer,
          recurring: boolean,
          weighted_interval: String.t() | nil
        }

  defstruct [
    :__info__,
    :active_subscriptions_count,
    :aggregation_type,
    :code,
    :created_at,
    :description,
    :draft_invoices_count,
    :field_name,
    :filters,
    :lago_id,
    :name,
    :plans_count,
    :recurring,
    :weighted_interval
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active_subscriptions_count: :integer,
      aggregation_type:
        {:enum,
         ["count_agg", "sum_agg", "max_agg", "unique_count_agg", "weighted_sum_agg", "latest_agg"]},
      code: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:string, :generic},
      draft_invoices_count: :integer,
      field_name: {:string, :generic},
      filters: [{LagoApiClient.BillableMetricFilterObject, :t}],
      lago_id: {:string, :uuid},
      name: {:string, :generic},
      plans_count: :integer,
      recurring: :boolean,
      weighted_interval: {:const, "seconds"}
    ]
  end
end
