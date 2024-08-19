defmodule LagoApiClient.CreditNoteEstimatedEstimatedCreditNoteItems do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimatedEstimatedCreditNoteItems
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, amount_cents: integer, lago_fee_id: String.t() | nil}

  defstruct [:__info__, :amount_cents, :lago_fee_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount_cents: :integer, lago_fee_id: {:string, :uuid}]
  end
end
