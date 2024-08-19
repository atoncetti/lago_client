defmodule LagoApiClient.SubscriptionUpdateInput do
  @moduledoc """
  Provides struct and type for a SubscriptionUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          status: String.t() | nil,
          subscription: LagoApiClient.SubscriptionUpdateInputSubscription.t()
        }

  defstruct [:__info__, :status, :subscription]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      status: {:enum, ["active", "pending"]},
      subscription: {LagoApiClient.SubscriptionUpdateInputSubscription, :t}
    ]
  end
end
