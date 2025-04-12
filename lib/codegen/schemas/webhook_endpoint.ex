defmodule LagoClient.WebhookEndpoint do
  @moduledoc """
  Provides struct and type for a WebhookEndpoint
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, webhook_endpoint: LagoClient.WebhookEndpointObject.t()}

  defstruct [:__info__, :webhook_endpoint]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [webhook_endpoint: {LagoClient.WebhookEndpointObject, :t}]
  end
end
