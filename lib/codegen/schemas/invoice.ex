defmodule LagoClient.Invoice do
  @moduledoc """
  Provides struct and type for a Invoice
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, invoice: LagoClient.InvoiceObjectExtended.t()}

  defstruct [:__info__, :invoice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice: {LagoClient.InvoiceObjectExtended, :t}]
  end
end
