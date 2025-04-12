defmodule LagoClient.WebhookEndpointsPaginated do
  @moduledoc """
  Provides struct and type for a WebhookEndpointsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          webhook_endpoints: [LagoClient.WebhookEndpointObject.t()]
        }

  defstruct [:__info__, :meta, :webhook_endpoints]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {LagoClient.PaginationMeta, :t},
      webhook_endpoints: [{LagoClient.WebhookEndpointObject, :t}]
    ]
  end
end
