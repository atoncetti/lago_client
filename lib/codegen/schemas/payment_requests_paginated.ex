defmodule LagoClient.PaymentRequestsPaginated do
  @moduledoc """
  Provides struct and type for a PaymentRequestsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          payment_requests: [LagoClient.PaymentRequestObject.t()]
        }

  defstruct [:__info__, :meta, :payment_requests]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      meta: {LagoClient.PaginationMeta, :t},
      payment_requests: [{LagoClient.PaymentRequestObject, :t}]
    ]
  end
end
