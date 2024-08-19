defmodule LagoApiClient.Invoice do
  @moduledoc """
  Provides struct and type for a Invoice
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, invoice: LagoApiClient.InvoiceObjectExtended.t()}

  defstruct [:__info__, :invoice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoice: {LagoApiClient.InvoiceObjectExtended, :t}]
  end
end
