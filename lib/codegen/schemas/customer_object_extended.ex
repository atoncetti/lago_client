defmodule LagoClient.CustomerObjectExtended do
  @moduledoc """
  Provides struct and type for a CustomerObjectExtended
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applicable_invoice_custom_sections: [LagoClient.InvoiceCustomSectionObject.t()] | nil,
          metadata: [LagoClient.CustomerMetadata.t()] | nil,
          taxes: [LagoClient.TaxObject.t()] | nil
        }

  defstruct [:__info__, :applicable_invoice_custom_sections, :metadata, :taxes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applicable_invoice_custom_sections: [{LagoClient.InvoiceCustomSectionObject, :t}],
      metadata: [{LagoClient.CustomerMetadata, :t}],
      taxes: [{LagoClient.TaxObject, :t}]
    ]
  end
end
