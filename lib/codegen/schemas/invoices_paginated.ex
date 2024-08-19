defmodule LagoApiClient.InvoicesPaginated do
  @moduledoc """
  Provides struct and type for a InvoicesPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          invoices: [LagoApiClient.InvoiceObject.t()],
          meta: LagoApiClient.PaginationMeta.t()
        }

  defstruct [:__info__, :invoices, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoices: [{LagoApiClient.InvoiceObject, :t}], meta: {LagoApiClient.PaginationMeta, :t}]
  end
end
