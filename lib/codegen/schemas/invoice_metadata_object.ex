defmodule LagoClient.InvoiceMetadataObject do
  @moduledoc """
  Provides struct and type for a InvoiceMetadataObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t() | nil,
          key: String.t() | nil,
          lago_id: String.t() | nil,
          value: String.t() | nil
        }

  defstruct [:__info__, :created_at, :key, :lago_id, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      key: {:string, :generic},
      lago_id: {:string, :uuid},
      value: {:string, :generic}
    ]
  end
end
