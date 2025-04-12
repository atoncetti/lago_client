defmodule LagoClient.CustomerBillingConfiguration do
  @moduledoc """
  Provides struct and type for a CustomerBillingConfiguration
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          document_locale: String.t() | nil,
          invoice_grace_period: integer | nil,
          payment_provider: String.t() | nil,
          payment_provider_code: String.t() | nil,
          provider_customer_id: String.t() | nil,
          provider_payment_methods: [String.t()] | nil,
          sync: boolean | nil,
          sync_with_provider: boolean | nil
        }

  defstruct [
    :__info__,
    :document_locale,
    :invoice_grace_period,
    :payment_provider,
    :payment_provider_code,
    :provider_customer_id,
    :provider_payment_methods,
    :sync,
    :sync_with_provider
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      document_locale: {:string, :generic},
      invoice_grace_period: :integer,
      payment_provider: {:enum, ["stripe", "adyen", "gocardless"]},
      payment_provider_code: {:string, :generic},
      provider_customer_id: {:string, :generic},
      provider_payment_methods: {:union, [[string: :generic], :null]},
      sync: :boolean,
      sync_with_provider: :boolean
    ]
  end
end
