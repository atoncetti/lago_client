defmodule LagoApiClient.InvoiceCollections do
  @moduledoc """
  Provides struct and type for a InvoiceCollections
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          invoice_collections: [LagoApiClient.InvoiceCollectionObject.t()]
        }

  defstruct [:__info__, :invoice_collections]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice_collections: [{LagoApiClient.InvoiceCollectionObject, :t}]]
  end
end
