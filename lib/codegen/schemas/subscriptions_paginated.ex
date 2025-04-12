defmodule LagoClient.SubscriptionsPaginated do
  @moduledoc """
  Provides struct and type for a SubscriptionsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          subscriptions: [LagoClient.SubscriptionObject.t()]
        }

  defstruct [:__info__, :meta, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoClient.PaginationMeta, :t}, subscriptions: [{LagoClient.SubscriptionObject, :t}]]
  end
end
