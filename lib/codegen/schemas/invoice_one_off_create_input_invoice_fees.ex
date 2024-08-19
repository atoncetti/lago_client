defmodule LagoApiClient.InvoiceOneOffCreateInputInvoiceFees do
  @moduledoc """
  Provides struct and type for a InvoiceOneOffCreateInputInvoiceFees
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          add_on_code: String.t(),
          description: String.t() | nil,
          invoice_display_name: String.t() | nil,
          tax_codes: [String.t()] | nil,
          unit_amount_cents: integer | nil,
          units: String.t() | nil
        }

  defstruct [
    :__info__,
    :add_on_code,
    :description,
    :invoice_display_name,
    :tax_codes,
    :unit_amount_cents,
    :units
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      add_on_code: {:string, :generic},
      description: {:string, :generic},
      invoice_display_name: {:string, :generic},
      tax_codes: [string: :generic],
      unit_amount_cents: :integer,
      units: {:string, :generic}
    ]
  end
end
