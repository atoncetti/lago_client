defmodule LagoClient.CustomerCheckoutUrlCustomer do
  @moduledoc """
  Provides struct and type for a CustomerCheckoutUrlCustomer
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          checkout_url: String.t() | nil,
          external_customer_id: String.t(),
          lago_customer_id: String.t(),
          payment_provider: String.t(),
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
