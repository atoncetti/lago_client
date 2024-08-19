defmodule LagoApiClient.InvoicedUsageObject do
  @moduledoc """
  Provides struct and type for a InvoicedUsageObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          code: String.t() | nil,
          currency: LagoApiClient.InvoicedUsageObjectCurrency.t(),
          month: String.t()
        }

  defstruct [:__info__, :amount_cents, :code, :currency, :month]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      code: {:string, :generic},
      currency: {LagoApiClient.InvoicedUsageObjectCurrency, :t},
      month: {:string, :generic}
    ]
  end
end
