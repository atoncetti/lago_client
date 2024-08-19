defmodule LagoApiClient.InvoiceUpdateInput do
  @moduledoc """
  Provides struct and type for a InvoiceUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, invoice: LagoApiClient.InvoiceUpdateInputInvoice.t()}

  defstruct [:__info__, :invoice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice: {LagoApiClient.InvoiceUpdateInputInvoice, :t}]
  end
end
