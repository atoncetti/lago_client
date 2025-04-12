defmodule LagoClient.PaymentCreateInput do
  @moduledoc """
  Provides struct and type for a PaymentCreateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, payment: LagoClient.PaymentCreateInputPayment.t()}

  defstruct [:__info__, :payment]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment: {LagoClient.PaymentCreateInputPayment, :t}]
  end
end
