defmodule LagoApiClient.MinimumCommitmentInput do
  @moduledoc """
  Provides struct and type for a MinimumCommitmentInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          invoice_display_name: String.t() | nil,
          tax_codes: [String.t()] | nil
        }

  defstruct [:__info__, :amount_cents, :invoice_display_name, :tax_codes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      invoice_display_name: {:string, :generic},
      tax_codes: [string: :generic]
    ]
  end
end
