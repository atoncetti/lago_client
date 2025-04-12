defmodule LagoClient.PaymentCreateInputPayment do
  @moduledoc """
  Provides struct and type for a PaymentCreateInputPayment
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          invoice_id: String.t(),
          paid_at: Date.t() | nil,
          reference: String.t()
        }

  defstruct [:__info__, :amount_cents, :invoice_id, :paid_at, :reference]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      invoice_id: {:string, :generic},
      paid_at: {:string, :date},
      reference: {:string, :generic}
    ]
  end
end
