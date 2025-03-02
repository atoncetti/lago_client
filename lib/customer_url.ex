defmodule LagoApiClient.CustomerUrl do
  @moduledoc """
  Provides struct and type for a CustomerUrl

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:generate_customer_checkout_url_200_json_resp) do
    [customer: {LagoApiClient.CustomerUrl, :t}]
  end

  def __fields__(:get_customer_portal_url_200_json_resp) do
    [customer: {LagoApiClient.CustomerUrl, :t}]
  end
  """

  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          checkout_url: String.t() | nil,
          external_customer_id: String.t() | nil,
          lago_customer_id: String.t() | nil,
          payment_provider: String.t() | nil,
          payment_provider_code: String.t() | nil
        }

  defstruct [
    :__info__,
    :checkout_url,
    :external_customer_id,
    :lago_customer_id,
    :payment_provider,
    :payment_provider_code
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checkout_url: {:string, :generic},
      external_customer_id: {:string, :generic},
      lago_customer_id: {:string, :generic},
      payment_provider: {:string, :generic},
      payment_provider_code: {:string, :generic}
    ]
  end
end
