defmodule LagoClient.SubscriptionCreateInputSubscription do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateInputSubscription
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billing_time: String.t() | nil,
          ending_at: DateTime.t() | nil,
          external_customer_id: String.t(),
          external_id: String.t(),
          name: String.t() | nil,
          plan_code: String.t(),
          plan_overrides: LagoClient.PlanOverridesObject.t() | nil,
          subscription_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :billing_time,
    :ending_at,
    :external_customer_id,
    :external_id,
    :name,
    :plan_code,
    :plan_overrides,
    :subscription_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_time: {:enum, ["calendar", "anniversary"]},
      ending_at: {:string, :date_time},
      external_customer_id: {:string, :generic},
      external_id: {:string, :generic},
      name: {:string, :generic},
      plan_code: {:string, :generic},
      plan_overrides: {LagoClient.PlanOverridesObject, :t},
      subscription_at: {:string, :date_time}
    ]
  end
end
