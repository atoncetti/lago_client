defmodule LagoClient.PaymentReceiptsPaginated do
  @moduledoc """
  Provides struct and type for a PaymentReceiptsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          payment_receipts: [LagoClient.PaymentReceiptObject.t()]
        }

  defstruct [:__info__, :meta, :payment_receipts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {LagoClient.PaginationMeta, :t},
      payment_receipts: [{LagoClient.PaymentReceiptObject, :t}]
    ]
  end
end
