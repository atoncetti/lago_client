defmodule LagoApiClient.GrossRevenueObject do
  @moduledoc """
  Provides struct and type for a GrossRevenueObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          currency: LagoApiClient.GrossRevenueObjectCurrency.t(),
          invoices_count: integer,
          month: String.t()
        }

  defstruct [:__info__, :amount_cents, :currency, :invoices_count, :month]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      currency: {LagoApiClient.GrossRevenueObjectCurrency, :t},
      invoices_count: :integer,
      month: {:string, :generic}
    ]
  end
end
