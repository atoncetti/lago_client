defmodule LagoApiClient.WebhookEndpointUpdateInput do
  @moduledoc """
  Provides struct and type for a WebhookEndpointUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          webhook_endpoint: LagoApiClient.WebhookEndpointUpdateInputWebhookEndpoint.t() | nil
        }

  defstruct [:__info__, :webhook_endpoint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [webhook_endpoint: {LagoApiClient.WebhookEndpointUpdateInputWebhookEndpoint, :t}]
  end
end
