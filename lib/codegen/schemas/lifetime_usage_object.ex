defmodule LagoClient.LifetimeUsageObject do
  @moduledoc """
  Provides struct and type for a LifetimeUsageObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          current_usage_amount_cents: integer,
          external_historical_usage_amount_cents: integer,
          external_subscription_id: String.t(),
          from_datetime: DateTime.t(),
          invoiced_usage_amount_cents: integer,
          lago_id: String.t(),
          lago_subscription_id: String.t(),
          to_datetime: DateTime.t(),
          usage_thresholds: [LagoClient.LifetimeUsageThresholdObject.t()] | nil
        }

  defstruct [
    :__info__,
    :current_usage_amount_cents,
    :external_historical_usage_amount_cents,
    :external_subscription_id,
    :from_datetime,
    :invoiced_usage_amount_cents,
    :lago_id,
    :lago_subscription_id,
    :to_datetime,
    :usage_thresholds
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      current_usage_amount_cents: :integer,
      external_historical_usage_amount_cents: :integer,
      external_subscription_id: {:string, :generic},
      from_datetime: {:string, :date_time},
      invoiced_usage_amount_cents: :integer,
      lago_id: {:string, :uuid},
      lago_subscription_id: {:string, :uuid},
      to_datetime: {:string, :date_time},
      usage_thresholds: [{LagoClient.LifetimeUsageThresholdObject, :t}]
    ]
  end
end
