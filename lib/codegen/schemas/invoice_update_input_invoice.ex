defmodule LagoClient.InvoiceUpdateInputInvoice do
  @moduledoc """
  Provides struct and type for a InvoiceUpdateInputInvoice
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          metadata: [LagoClient.InvoiceUpdateInputInvoiceMetadata.t()] | nil,
          payment_status: String.t() | nil
        }

  defstruct [:__info__, :metadata, :payment_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: [{LagoClient.InvoiceUpdateInputInvoiceMetadata, :t}],
      payment_status: {:enum, ["pending", "succeeded", "failed"]}
    ]
  end
end
