defmodule LagoApiClient.FeeUpdateInputFee do
  @moduledoc """
  Provides struct and type for a FeeUpdateInputFee
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, payment_status: String.t()}

  defstruct [:__info__, :payment_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [payment_status: {:enum, ["pending", "succeeded", "failed", "refunded"]}]
  end
end
