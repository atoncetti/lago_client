defmodule LagoApiClient.WebhookEndpointObject do
  @moduledoc """
  Provides struct and type for a WebhookEndpointObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          lago_id: String.t(),
          lago_organization_id: String.t(),
          signature_algo: String.t() | nil,
          webhook_url: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :lago_id,
    :lago_organization_id,
    :signature_algo,
    :webhook_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      lago_id: {:string, :uuid},
      lago_organization_id: {:string, :uuid},
      signature_algo: {:enum, ["jwt", "hmac"]},
      webhook_url: {:string, :generic}
    ]
  end
end
