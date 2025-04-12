defmodule LagoClient.InvoiceCollections do
  @moduledoc """
  Provides struct and type for a InvoiceCollections
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          invoice_collections: [LagoClient.InvoiceCollectionObject.t()]
        }

  defstruct [:__info__, :invoice_collections]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice_collections: [{LagoClient.InvoiceCollectionObject, :t}]]
  end
end
