defmodule LagoApiClient.WebhookEndpointsPaginated do
  @moduledoc """
  Provides struct and type for a WebhookEndpointsPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoApiClient.PaginationMeta.t(),
          webhook_endpoints: [LagoApiClient.WebhookEndpointObject.t()]
        }

  defstruct [:__info__, :meta, :webhook_endpoints]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {LagoApiClient.PaginationMeta, :t},
      webhook_endpoints: [{LagoApiClient.WebhookEndpointObject, :t}]
    ]
  end
end
