defmodule LagoApiClient.CustomerCreateInputCustomer do
  @moduledoc """
  Provides struct and type for a CustomerCreateInputCustomer
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          billing_configuration: LagoApiClient.CustomerBillingConfiguration.t() | nil,
          city: String.t() | nil,
          country: LagoApiClient.CustomerCreateInputCustomerCountry.t() | nil,
          currency: LagoApiClient.CustomerCreateInputCustomerCurrency.t() | nil,
          email: String.t() | nil,
          external_id: String.t(),
          integration_customers:
            [LagoApiClient.CustomerCreateInputCustomerIntegrationCustomers.t()] | nil,
          legal_name: String.t() | nil,
          legal_number: String.t() | nil,
          logo_url: String.t() | nil,
          metadata: [LagoApiClient.CustomerCreateInputCustomerMetadata.t()] | nil,
          name: String.t() | nil,
          net_payment_term: integer | nil,
          phone: String.t() | nil,
          shipping_address: LagoApiClient.Address.t() | nil,
          state: String.t() | nil,
          tax_codes: [String.t()] | nil,
          tax_identification_number: String.t() | nil,
          timezone: LagoApiClient.CustomerCreateInputCustomerTimezone.t() | nil,
          url: String.t() | nil,
          zipcode: String.t() | nil
        }

  defstruct [
    :__info__,
    :address_line1,
    :address_line2,
    :billing_configuration,
    :city,
    :country,
    :currency,
    :email,
    :external_id,
    :integration_customers,
    :legal_name,
    :legal_number,
    :logo_url,
    :metadata,
    :name,
    :net_payment_term,
    :phone,
    :shipping_address,
    :state,
    :tax_codes,
    :tax_identification_number,
    :timezone,
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
      billing_configuration: {LagoApiClient.CustomerBillingConfiguration, :t},
      city: {:string, :generic},
      country: {LagoApiClient.CustomerCreateInputCustomerCountry, :t},
      currency: {LagoApiClient.CustomerCreateInputCustomerCurrency, :t},
      email: {:string, :email},
      external_id: {:string, :generic},
      integration_customers: [{LagoApiClient.CustomerCreateInputCustomerIntegrationCustomers, :t}],
      legal_name: {:string, :generic},
      legal_number: {:string, :generic},
      logo_url: {:string, :generic},
      metadata: [{LagoApiClient.CustomerCreateInputCustomerMetadata, :t}],
      name: {:string, :generic},
      net_payment_term: :integer,
      phone: {:string, :generic},
      shipping_address: {LagoApiClient.Address, :t},
      state: {:string, :generic},
      tax_codes: [string: :generic],
      tax_identification_number: {:string, :generic},
      timezone: {LagoApiClient.CustomerCreateInputCustomerTimezone, :t},
      url: {:string, :generic},
      zipcode: {:string, :generic}
    ]
  end
end
