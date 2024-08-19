defmodule LagoApiClient.OverdueBalanceObject do
  @moduledoc """
  Provides struct and type for a OverdueBalanceObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          currency: LagoApiClient.OverdueBalanceObjectCurrency.t(),
          lago_invoice_ids: [String.t()],
          month: String.t()
        }

  defstruct [:__info__, :amount_cents, :currency, :lago_invoice_ids, :month]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      currency: {LagoApiClient.OverdueBalanceObjectCurrency, :t},
      lago_invoice_ids: [string: :uuid],
      month: {:string, :generic}
    ]
  end
end
