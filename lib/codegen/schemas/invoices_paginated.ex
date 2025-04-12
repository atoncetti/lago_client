defmodule LagoClient.InvoicesPaginated do
  @moduledoc """
  Provides struct and type for a InvoicesPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          invoices: [LagoClient.InvoiceObject.t()],
          meta: LagoClient.PaginationMeta.t()
        }

  defstruct [:__info__, :invoices, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoices: [{LagoClient.InvoiceObject, :t}], meta: {LagoClient.PaginationMeta, :t}]
  end
end
