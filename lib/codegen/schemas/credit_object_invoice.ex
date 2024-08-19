defmodule LagoApiClient.CreditObjectInvoice do
  @moduledoc """
  Provides struct and type for a CreditObjectInvoice
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, lago_id: String.t(), payment_status: String.t()}

  defstruct [:__info__, :lago_id, :payment_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [lago_id: {:string, :uuid}, payment_status: {:enum, ["pending", "succeeded", "failed"]}]
  end
end
