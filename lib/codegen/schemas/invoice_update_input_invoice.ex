defmodule LagoApiClient.InvoiceUpdateInputInvoice do
  @moduledoc """
  Provides struct and type for a InvoiceUpdateInputInvoice
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          metadata: [LagoApiClient.InvoiceUpdateInputInvoiceMetadata.t()] | nil,
          payment_status: String.t() | nil
        }

  defstruct [:__info__, :metadata, :payment_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: [{LagoApiClient.InvoiceUpdateInputInvoiceMetadata, :t}],
      payment_status: {:enum, ["pending", "succeeded", "failed"]}
    ]
  end
end
