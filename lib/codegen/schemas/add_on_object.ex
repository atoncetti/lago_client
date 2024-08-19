defmodule LagoApiClient.AddOnObject do
  @moduledoc """
  Provides struct and type for a AddOnObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          amount_currency: LagoApiClient.AddOnObjectAmountCurrency.t(),
          code: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          invoice_display_name: String.t() | nil,
          lago_id: String.t(),
          name: String.t(),
          taxes: [LagoApiClient.TaxObject.t()] | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :code,
    :created_at,
    :description,
    :invoice_display_name,
    :lago_id,
    :name,
    :taxes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: {LagoApiClient.AddOnObjectAmountCurrency, :t},
      code: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:string, :generic},
      invoice_display_name: {:string, :generic},
      lago_id: {:string, :uuid},
      name: {:string, :generic},
      taxes: [{LagoApiClient.TaxObject, :t}]
    ]
  end
end
