defmodule LagoClient.InvoiceCollectionObjectCurrency do
  @moduledoc """
  Provides struct and type for a InvoiceCollectionObjectCurrency
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map}

  defstruct [:__info__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    []
  end
end
