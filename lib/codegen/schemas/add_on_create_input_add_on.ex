defmodule LagoClient.AddOnCreateInputAddOn do
  @moduledoc """
  Provides struct and type for a AddOnCreateInputAddOn
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          amount_currency: map | nil,
          code: String.t() | nil,
          description: String.t() | nil,
          invoice_display_name: String.t() | nil,
          name: String.t() | nil,
          tax_codes: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :amount_currency,
    :code,
    :description,
    :invoice_display_name,
    :name,
    :tax_codes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      amount_currency: :map,
      code: {:string, :generic},
      description: {:string, :generic},
      invoice_display_name: {:string, :generic},
      name: {:string, :generic},
      tax_codes: [string: :generic]
    ]
  end
end
