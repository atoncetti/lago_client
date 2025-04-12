defmodule LagoClient.InvoicePaymentUrlInvoicePaymentDetails do
  @moduledoc """
  Provides struct and type for a InvoicePaymentUrlInvoicePaymentDetails
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          external_customer_id: String.t() | nil,
          lago_customer_id: String.t() | nil,
          lago_invoice_id: String.t() | nil,
          payment_provider: String.t() | nil,
          payment_url: String.t() | nil
        }

  defstruct [
    :__info__,
    :external_customer_id,
    :lago_customer_id,
    :lago_invoice_id,
    :payment_provider,
    :payment_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_customer_id: {:string, :generic},
      lago_customer_id: {:string, :generic},
      lago_invoice_id: {:string, :generic},
      payment_provider: {:string, :generic},
      payment_url: {:string, :generic}
    ]
  end
end
