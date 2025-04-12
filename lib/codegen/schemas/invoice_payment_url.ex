defmodule LagoClient.InvoicePaymentUrl do
  @moduledoc """
  Provides struct and type for a InvoicePaymentUrl
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          invoice_payment_details: LagoClient.InvoicePaymentUrlInvoicePaymentDetails.t() | nil
        }

  defstruct [:__info__, :invoice_payment_details]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice_payment_details: {LagoClient.InvoicePaymentUrlInvoicePaymentDetails, :t}]
  end
end
