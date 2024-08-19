defmodule LagoApiClient.InvoiceOneOffCreateInputInvoice do
  @moduledoc """
  Provides struct and type for a InvoiceOneOffCreateInputInvoice
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          currency: LagoApiClient.InvoiceOneOffCreateInputInvoiceCurrency.t() | nil,
          external_customer_id: String.t(),
          fees: [LagoApiClient.InvoiceOneOffCreateInputInvoiceFees.t()]
        }

  defstruct [:__info__, :currency, :external_customer_id, :fees]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      currency: {LagoApiClient.InvoiceOneOffCreateInputInvoiceCurrency, :t},
      external_customer_id: {:string, :generic},
      fees: [{LagoApiClient.InvoiceOneOffCreateInputInvoiceFees, :t}]
    ]
  end
end
