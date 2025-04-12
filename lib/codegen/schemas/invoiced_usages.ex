defmodule LagoClient.InvoicedUsages do
  @moduledoc """
  Provides struct and type for a InvoicedUsages
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, invoiced_usages: [LagoClient.InvoicedUsageObject.t()]}

  defstruct [:__info__, :invoiced_usages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoiced_usages: [{LagoClient.InvoicedUsageObject, :t}]]
  end
end
