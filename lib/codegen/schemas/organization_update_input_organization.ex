defmodule LagoApiClient.OrganizationUpdateInputOrganization do
  @moduledoc """
  Provides struct and type for a OrganizationUpdateInputOrganization
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          billing_configuration: LagoApiClient.OrganizationBillingConfiguration.t() | nil,
          city: String.t() | nil,
          country: LagoApiClient.OrganizationUpdateInputOrganizationCountry.t() | nil,
          default_currency:
            LagoApiClient.OrganizationUpdateInputOrganizationDefaultCurrency.t() | nil,
          document_number_prefix: String.t() | nil,
          document_numbering: String.t() | nil,
          email: String.t() | nil,
          email_settings: [String.t()] | nil,
          legal_name: String.t() | nil,
          legal_number: String.t() | nil,
          net_payment_term: integer | nil,
          state: String.t() | nil,
          tax_identification_number: String.t() | nil,
          timezone: LagoApiClient.OrganizationUpdateInputOrganizationTimezone.t() | nil,
          webhook_url: String.t() | nil,
          zipcode: String.t() | nil
        }

  defstruct [
    :__info__,
    :address_line1,
    :address_line2,
    :billing_configuration,
    :city,
    :country,
    :default_currency,
    :document_number_prefix,
    :document_numbering,
    :email,
    :email_settings,
    :legal_name,
    :legal_number,
    :net_payment_term,
    :state,
    :tax_identification_number,
    :timezone,
    :webhook_url,
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
      country: {LagoApiClient.OrganizationUpdateInputOrganizationCountry, :t},
      default_currency: {LagoApiClient.OrganizationUpdateInputOrganizationDefaultCurrency, :t},
      document_number_prefix: {:string, :generic},
      document_numbering: {:enum, ["per_customer", "per_organization"]},
      email: {:string, :email},
      email_settings: [enum: ["invoice.finalized", "credit_note.created"]],
      legal_name: {:string, :generic},
      legal_number: {:string, :generic},
      net_payment_term: :integer,
      state: {:string, :generic},
      tax_identification_number: {:string, :generic},
      timezone: {LagoApiClient.OrganizationUpdateInputOrganizationTimezone, :t},
      webhook_url: {:string, :generic},
      zipcode: {:string, :generic}
    ]
  end
end
