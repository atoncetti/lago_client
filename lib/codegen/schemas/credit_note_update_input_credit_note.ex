defmodule LagoApiClient.CreditNoteUpdateInputCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteUpdateInputCreditNote
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, refund_status: String.t()}

  defstruct [:__info__, :refund_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [refund_status: {:enum, ["pending", "succeeded", "failed"]}]
  end
end
