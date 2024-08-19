defmodule LagoApiClient.InvoiceCollectionObject do
  @moduledoc """
  Provides struct and type for a InvoiceCollectionObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          currency: LagoApiClient.InvoiceCollectionObjectCurrency.t() | nil,
          invoices_count: integer,
          month: String.t(),
          payment_status: String.t() | nil
        }

  defstruct [:__info__, :amount_cents, :currency, :invoices_count, :month, :payment_status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      currency: {LagoApiClient.InvoiceCollectionObjectCurrency, :t},
      invoices_count: :integer,
      month: {:string, :generic},
      payment_status: {:enum, ["pending", "succeeded", "failed"]}
    ]
  end
end
