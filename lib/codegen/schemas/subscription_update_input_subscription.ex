defmodule LagoApiClient.SubscriptionUpdateInputSubscription do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateInputSubscription
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          ending_at: DateTime.t() | nil,
          name: String.t() | nil,
          plan_overrides: LagoApiClient.PlanOverridesObject.t() | nil,
          subscription_at: DateTime.t() | nil
        }

  defstruct [:__info__, :ending_at, :name, :plan_overrides, :subscription_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ending_at: {:string, :date_time},
      name: {:string, :generic},
      plan_overrides: {LagoApiClient.PlanOverridesObject, :t},
      subscription_at: {:string, :date_time}
    ]
  end
end
