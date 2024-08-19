defmodule LagoApiClient.CreditObject do
  @moduledoc """
  Provides struct and type for a CreditObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          amount_currency: LagoApiClient.CreditObjectAmountCurrency.t(),
          before_taxes: boolean,
          invoice: LagoApiClient.CreditObjectInvoice.t(),
          item: LagoApiClient.CreditObjectItem.t(),
          lago_id: String.t()
        }

  defstruct [:__info__, :amount_cents, :amount_currency, :before_taxes, :invoice, :item, :lago_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {LagoApiClient.CreditObjectAmountCurrency, :t},
      before_taxes: :boolean,
      invoice: {LagoApiClient.CreditObjectInvoice, :t},
      item: {LagoApiClient.CreditObjectItem, :t},
      lago_id: {:string, :uuid}
    ]
  end
end
