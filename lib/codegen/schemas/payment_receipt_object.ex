defmodule LagoClient.PaymentReceiptObject do
  @moduledoc """
  Provides struct and type for a PaymentReceiptObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          lago_id: String.t(),
          number: String.t(),
          payment: LagoClient.PaymentObject.t()
        }

  defstruct [:__info__, :created_at, :lago_id, :number, :payment]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      lago_id: {:string, :uuid},
      number: {:string, :generic},
      payment: {LagoClient.PaymentObject, :t}
    ]
  end
end
