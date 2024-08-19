defmodule LagoApiClient.CustomerObjectExtended do
  @moduledoc """
  Provides struct and type for a CustomerObjectExtended
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          applicable_timezone: map | nil,
          billing_configuration: LagoApiClient.CustomerBillingConfiguration.t() | nil,
          city: String.t() | nil,
          country: map | nil,
          created_at: DateTime.t() | nil,
          currency: map | nil,
          email: String.t() | nil,
          external_id: String.t() | nil,
          integration_customers: [LagoApiClient.IntegrationCustomer.t()] | nil,
          lago_id: String.t() | nil,
          legal_name: String.t() | nil,
          legal_number: String.t() | nil,
          logo_url: String.t() | nil,
          metadata: [LagoApiClient.CustomerMetadata.t()] | nil,
          name: String.t() | nil,
          net_payment_term: integer | nil,
          phone: String.t() | nil,
          sequential_id: integer | nil,
          shipping_address: LagoApiClient.Address.t() | nil,
          slug: String.t() | nil,
          state: String.t() | nil,
          tax_identification_number: String.t() | nil,
          taxes: [LagoApiClient.TaxObject.t()] | nil,
          timezone: map | nil,
          updated_at: DateTime.t() | nil,
          url: String.t() | nil,
          zipcode: String.t() | nil
        }

  defstruct [
    :__info__,
    :address_line1,
    :address_line2,
    :applicable_timezone,
    :billing_configuration,
    :city,
    :country,
    :created_at,
    :currency,
    :email,
    :external_id,
    :integration_customers,
    :lago_id,
    :legal_name,
    :legal_number,
    :logo_url,
    :metadata,
    :name,
    :net_payment_term,
    :phone,
    :sequential_id,
    :shipping_address,
    :slug,
    :state,
    :tax_identification_number,
    :taxes,
    :timezone,
    :updated_at,
    :url,
    :zipcode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      address_line1: {:string, :generic},
      address_line2: {:string, :generic},
      applicable_timezone: :map,
      billing_configuration: {LagoApiClient.CustomerBillingConfiguration, :t},
      city: {:string, :generic},
      country: :map,
      created_at: {:string, :date_time},
      currency: :map,
      email: {:string, :email},
      external_id: {:string, :generic},
      integration_customers: [{LagoApiClient.IntegrationCustomer, :t}],
      lago_id: {:string, :uuid},
      legal_name: {:string, :generic},
      legal_number: {:string, :generic},
      logo_url: {:string, :generic},
      metadata: [{LagoApiClient.CustomerMetadata, :t}],
      name: {:string, :generic},
      net_payment_term: :integer,
      phone: {:string, :generic},
      sequential_id: :integer,
      shipping_address: {LagoApiClient.Address, :t},
      slug: {:string, :generic},
      state: {:string, :generic},
      tax_identification_number: {:string, :generic},
      taxes: [{LagoApiClient.TaxObject, :t}],
      timezone: :map,
      updated_at: {:string, :date_time},
      url: {:string, :generic},
      zipcode: {:string, :generic}
    ]
  end
end
