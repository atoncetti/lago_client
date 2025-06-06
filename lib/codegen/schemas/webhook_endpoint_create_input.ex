defmodule LagoClient.WebhookEndpointCreateInput do
  @moduledoc """
  Provides struct and type for a WebhookEndpointCreateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          webhook_endpoint: LagoClient.WebhookEndpointCreateInputWebhookEndpoint.t() | nil
        }

  defstruct [:__info__, :webhook_endpoint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [webhook_endpoint: {LagoClient.WebhookEndpointCreateInputWebhookEndpoint, :t}]
  end
end
