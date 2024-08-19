defmodule LagoApiClient.CustomerCreateInputCustomerIntegrationCustomers do
  @moduledoc """
  Provides struct and type for a CustomerCreateInputCustomerIntegrationCustomers
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          external_customer_id: String.t() | nil,
          id: String.t() | nil,
          integration_code: String.t() | nil,
          integration_type: String.t() | nil,
          subsidiary_id: String.t() | nil,
          sync_with_provider: boolean | nil
        }

  defstruct [
    :__info__,
    :external_customer_id,
    :id,
    :integration_code,
    :integration_type,
    :subsidiary_id,
    :sync_with_provider
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: {:string, :generic},
      id: {:string, :uuid},
      integration_code: {:string, :generic},
      integration_type: {:const, "netsuite"},
      subsidiary_id: {:string, :generic},
      sync_with_provider: :boolean
    ]
  end
end
