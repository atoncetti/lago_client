defmodule LagoApiClient.MrrObject do
  @moduledoc """
  Provides struct and type for a MrrObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          currency: LagoApiClient.MrrObjectCurrency.t() | nil,
          month: String.t()
        }

  defstruct [:__info__, :amount_cents, :currency, :month]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      currency: {LagoApiClient.MrrObjectCurrency, :t},
      month: {:string, :generic}
    ]
  end
end
