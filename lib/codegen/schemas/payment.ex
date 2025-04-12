defmodule LagoClient.Payment do
  @moduledoc """
  Provides struct and type for a Payment
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, payment: LagoClient.PaymentManualObject.t()}

  defstruct [:__info__, :payment]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment: {LagoClient.PaymentManualObject, :t}]
  end
end
