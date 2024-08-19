defmodule LagoApiClient.SubscriptionObject do
  @moduledoc """
  Provides struct and type for a SubscriptionObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billing_time: String.t(),
          canceled_at: DateTime.t() | nil,
          created_at: DateTime.t(),
          downgrade_plan_date: Date.t() | nil,
          ending_at: DateTime.t() | nil,
          external_customer_id: String.t(),
          external_id: String.t(),
          lago_customer_id: String.t(),
          lago_id: String.t(),
          name: String.t() | nil,
          next_plan_code: String.t() | nil,
          plan_code: String.t(),
          previous_plan_code: String.t() | nil,
          started_at: DateTime.t() | nil,
          status: String.t(),
          subscription_at: DateTime.t(),
          terminated_at: DateTime.t() | nil,
          trial_ended_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :billing_time,
    :canceled_at,
    :created_at,
    :downgrade_plan_date,
    :ending_at,
    :external_customer_id,
    :external_id,
    :lago_customer_id,
    :lago_id,
    :name,
    :next_plan_code,
    :plan_code,
    :previous_plan_code,
    :started_at,
    :status,
    :subscription_at,
    :terminated_at,
    :trial_ended_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_time: {:enum, ["calendar", "anniversary"]},
      canceled_at: {:string, :date_time},
      created_at: {:string, :date_time},
      downgrade_plan_date: {:string, :date},
      ending_at: {:string, :date_time},
      external_customer_id: {:string, :generic},
      external_id: {:string, :generic},
      lago_customer_id: {:string, :uuid},
      lago_id: {:string, :uuid},
      name: {:string, :generic},
      next_plan_code: {:string, :generic},
      plan_code: {:string, :generic},
      previous_plan_code: {:string, :generic},
      started_at: {:string, :date_time},
      status: {:enum, ["active", "pending", "terminated", "canceled"]},
      subscription_at: {:string, :date_time},
      terminated_at: {:string, :date_time},
      trial_ended_at: {:string, :date_time}
    ]
  end
end
