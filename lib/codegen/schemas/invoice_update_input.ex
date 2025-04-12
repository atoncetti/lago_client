defmodule LagoClient.InvoiceUpdateInput do
  @moduledoc """
  Provides struct and type for a InvoiceUpdateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, invoice: LagoClient.InvoiceUpdateInputInvoice.t()}

  defstruct [:__info__, :invoice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice: {LagoClient.InvoiceUpdateInputInvoice, :t}]
  end
end
