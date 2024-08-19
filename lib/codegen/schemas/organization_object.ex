defmodule LagoApiClient.OrganizationObject do
  @moduledoc """
  Provides struct and type for a OrganizationObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          billing_configuration: LagoApiClient.OrganizationBillingConfiguration.t(),
          city: String.t() | nil,
          country: LagoApiClient.OrganizationObjectCountry.t() | nil,
          created_at: DateTime.t() | nil,
          default_currency: LagoApiClient.OrganizationObjectDefaultCurrency.t() | nil,
          document_number_prefix: String.t(),
          document_numbering: String.t(),
          email: String.t() | nil,
          lago_id: String.t(),
          legal_name: String.t() | nil,
          legal_number: String.t() | nil,
          name: String.t(),
          net_payment_term: integer | nil,
          state: String.t() | nil,
          tax_identification_number: String.t() | nil,
          taxes: [LagoApiClient.TaxObject.t()] | nil,
          timezone: LagoApiClient.OrganizationObjectTimezone.t() | nil,
          webhook_url: String.t() | nil,
          webhook_urls: [String.t()] | nil,
          zipcode: String.t() | nil
        }

  defstruct [
    :__info__,
    :address_line1,
    :address_line2,
    :billing_configuration,
    :city,
    :country,
    :created_at,
    :default_currency,
    :document_number_prefix,
    :document_numbering,
    :email,
    :lago_id,
    :legal_name,
    :legal_number,
    :name,
    :net_payment_term,
    :state,
    :tax_identification_number,
    :taxes,
    :timezone,
    :webhook_url,
    :webhook_urls,
    :zipcode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      address_line1: {:string, :generic},
      address_line2: {:string, :generic},
      billing_configuration: {LagoApiClient.OrganizationBillingConfiguration, :t},
      city: {:string, :generic},
      country: {LagoApiClient.OrganizationObjectCountry, :t},
      created_at: {:string, :date_time},
      default_currency: {LagoApiClient.OrganizationObjectDefaultCurrency, :t},
      document_number_prefix: {:string, :generic},
      document_numbering: {:enum, ["per_customer", "per_organization"]},
      email: {:string, :email},
      lago_id: {:string, :uuid},
      legal_name: {:string, :generic},
      legal_number: {:string, :generic},
      name: {:string, :generic},
      net_payment_term: :integer,
      state: {:string, :generic},
      tax_identification_number: {:string, :generic},
      taxes: [{LagoApiClient.TaxObject, :t}],
      timezone: {LagoApiClient.OrganizationObjectTimezone, :t},
      webhook_url: {:string, :generic},
      webhook_urls: [string: :generic],
      zipcode: {:string, :generic}
    ]
  end
end
