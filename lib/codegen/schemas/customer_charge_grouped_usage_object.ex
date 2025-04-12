defmodule LagoClient.CustomerChargeGroupedUsageObject do
  @moduledoc """
  Provides struct and type for a CustomerChargeGroupedUsageObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          events_count: integer | nil,
          filters: [LagoClient.CustomerChargeFiltersUsageObject.t()] | nil,
          grouped_by: LagoClient.CustomerChargeGroupedUsageObjectGroupedBy.t() | nil,
          units: String.t() | nil
        }

  defstruct [:__info__, :amount_cents, :events_count, :filters, :grouped_by, :units]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      events_count: :integer,
      filters: [{LagoClient.CustomerChargeFiltersUsageObject, :t}],
      grouped_by: {LagoClient.CustomerChargeGroupedUsageObjectGroupedBy, :t},
      units: {:string, :generic}
    ]
  end
end
