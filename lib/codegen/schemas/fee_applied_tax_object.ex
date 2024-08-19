defmodule LagoApiClient.FeeAppliedTaxObject do
  @moduledoc """
  Provides struct and type for a FeeAppliedTaxObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: map | nil,
          created_at: DateTime.t() | nil,
          lago_id: String.t() | nil,
          lago_tax_id: String.t() | nil,
          tax_code: String.t() | nil,
          tax_description: String.t() | nil,
          tax_name: String.t() | nil,
          tax_rate: number | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :created_at,
    :lago_id,
    :lago_tax_id,
    :tax_code,
    :tax_description,
    :tax_name,
    :tax_rate
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: :map,
      created_at: {:string, :date_time},
      lago_id: {:string, :uuid},
      lago_tax_id: {:string, :uuid},
      tax_code: {:string, :generic},
      tax_description: {:string, :generic},
      tax_name: {:string, :generic},
      tax_rate: :number
    ]
  end
end
