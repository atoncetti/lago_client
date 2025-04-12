defmodule LagoClient.CustomerMetadata do
  @moduledoc """
  Provides struct and type for a CustomerMetadata
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          display_in_invoice: boolean,
          key: String.t(),
          lago_id: String.t(),
          value: String.t()
        }

  defstruct [:__info__, :created_at, :display_in_invoice, :key, :lago_id, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      display_in_invoice: :boolean,
      key: {:string, :generic},
      lago_id: {:string, :uuid},
      value: {:string, :generic}
    ]
  end
end
