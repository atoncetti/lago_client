defmodule LagoApiClient.SubscriptionCreateInput do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          subscription: LagoApiClient.SubscriptionCreateInputSubscription.t()
        }

  defstruct [:__info__, :subscription]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [subscription: {LagoApiClient.SubscriptionCreateInputSubscription, :t}]
  end
end
