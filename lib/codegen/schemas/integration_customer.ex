defmodule LagoApiClient.IntegrationCustomer do
  @moduledoc """
  Provides struct and type for a IntegrationCustomer
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          external_customer_id: String.t() | nil,
          integration_code: String.t() | nil,
          lago_id: String.t() | nil,
          subsidiary_id: String.t() | nil,
          sync_with_provider: boolean | nil,
          type: String.t() | nil
        }

  defstruct [
    :__info__,
    :external_customer_id,
    :integration_code,
    :lago_id,
    :subsidiary_id,
    :sync_with_provider,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: {:string, :generic},
      integration_code: {:string, :generic},
      lago_id: {:string, :uuid},
      subsidiary_id: {:string, :generic},
      sync_with_provider: :boolean,
      type: {:const, "netsuite"}
    ]
  end
end
