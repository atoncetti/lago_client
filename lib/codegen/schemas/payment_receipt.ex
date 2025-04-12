defmodule LagoClient.PaymentReceipt do
  @moduledoc """
  Provides struct and type for a PaymentReceipt
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, payment_receipt: LagoClient.PaymentReceiptObject.t()}

  defstruct [:__info__, :payment_receipt]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment_receipt: {LagoClient.PaymentReceiptObject, :t}]
  end
end
