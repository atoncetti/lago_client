defmodule LagoApiClient.CustomerChargeFiltersUsageObject do
  @moduledoc """
  Provides struct and type for a CustomerChargeFiltersUsageObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          events_count: integer | nil,
          invoice_display_name: String.t() | nil,
          units: String.t() | nil,
          values: LagoApiClient.CustomerChargeFiltersUsageObjectValues.t() | nil
        }

  defstruct [:__info__, :amount_cents, :events_count, :invoice_display_name, :units, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      events_count: :integer,
      invoice_display_name: {:string, :generic},
      units: {:string, :generic},
      values: {LagoApiClient.CustomerChargeFiltersUsageObjectValues, :t}
    ]
  end
end
