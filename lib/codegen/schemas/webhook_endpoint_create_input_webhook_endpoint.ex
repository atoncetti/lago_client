defmodule LagoApiClient.WebhookEndpointCreateInputWebhookEndpoint do
  @moduledoc """
  Provides struct and type for a WebhookEndpointCreateInputWebhookEndpoint
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, signature_algo: String.t() | nil, webhook_url: String.t()}

  defstruct [:__info__, :signature_algo, :webhook_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [signature_algo: {:enum, ["jwt", "hmac"]}, webhook_url: {:string, :generic}]
  end
end
