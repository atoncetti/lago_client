defmodule LagoClient.InvoiceOneOffCreateInput do
  @moduledoc """
  Provides struct and type for a InvoiceOneOffCreateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, invoice: LagoClient.InvoiceOneOffCreateInputInvoice.t()}

  defstruct [:__info__, :invoice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice: {LagoClient.InvoiceOneOffCreateInputInvoice, :t}]
  end
end
