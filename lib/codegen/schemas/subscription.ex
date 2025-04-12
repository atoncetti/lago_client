defmodule LagoClient.Subscription do
  @moduledoc """
  Provides struct and type for a Subscription
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, subscription: LagoClient.SubscriptionObjectExtended.t()}

  defstruct [:__info__, :subscription]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [subscription: {LagoClient.SubscriptionObjectExtended, :t}]
  end
end
