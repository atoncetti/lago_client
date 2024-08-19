defmodule LagoApiClient.SubscriptionsPaginated do
  @moduledoc """
  Provides struct and type for a SubscriptionsPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoApiClient.PaginationMeta.t(),
          subscriptions: [LagoApiClient.SubscriptionObject.t()]
        }

  defstruct [:__info__, :meta, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {LagoApiClient.PaginationMeta, :t},
      subscriptions: [{LagoApiClient.SubscriptionObject, :t}]
    ]
  end
end
