defmodule LagoApiClient.CreditNoteItemObject do
  @moduledoc """
  Provides struct and type for a CreditNoteItemObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          amount_currency: LagoApiClient.CreditNoteItemObjectAmountCurrency.t(),
          fee: LagoApiClient.CreditNoteItemObjectFee.t(),
          lago_id: String.t()
        }

  defstruct [:__info__, :amount_cents, :amount_currency, :fee, :lago_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {LagoApiClient.CreditNoteItemObjectAmountCurrency, :t},
      fee: {LagoApiClient.CreditNoteItemObjectFee, :t},
      lago_id: {:string, :uuid}
    ]
  end
end
