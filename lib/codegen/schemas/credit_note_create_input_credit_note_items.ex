defmodule LagoApiClient.CreditNoteCreateInputCreditNoteItems do
  @moduledoc """
  Provides struct and type for a CreditNoteCreateInputCreditNoteItems
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, amount_cents: integer, fee_id: String.t()}

  defstruct [:__info__, :amount_cents, :fee_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_cents: :integer, fee_id: {:string, :uuid}]
  end
end
