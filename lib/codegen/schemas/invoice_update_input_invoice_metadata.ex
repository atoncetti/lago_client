defmodule LagoApiClient.InvoiceUpdateInputInvoiceMetadata do
  @moduledoc """
  Provides struct and type for a InvoiceUpdateInputInvoiceMetadata
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          id: String.t() | nil,
          key: String.t() | nil,
          value: String.t() | nil
        }

  defstruct [:__info__, :id, :key, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :uuid}, key: {:string, :generic}, value: {:string, :generic}]
  end
end
