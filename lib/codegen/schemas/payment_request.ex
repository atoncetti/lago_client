defmodule LagoClient.PaymentRequest do
  @moduledoc """
  Provides struct and type for a PaymentRequest
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, payment_request: LagoClient.PaymentRequestObject.t()}

  defstruct [:__info__, :payment_request]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment_request: {LagoClient.PaymentRequestObject, :t}]
  end
end
