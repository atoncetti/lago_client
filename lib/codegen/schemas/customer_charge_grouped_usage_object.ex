defmodule LagoApiClient.CustomerChargeGroupedUsageObject do
  @moduledoc """
  Provides struct and type for a CustomerChargeGroupedUsageObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer | nil,
          events_count: integer | nil,
          filters: [LagoApiClient.CustomerChargeFiltersUsageObject.t()] | nil,
          grouped_by: LagoApiClient.CustomerChargeGroupedUsageObjectGroupedBy.t() | nil,
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
      filters: [{LagoApiClient.CustomerChargeFiltersUsageObject, :t}],
      grouped_by: {LagoApiClient.CustomerChargeGroupedUsageObjectGroupedBy, :t},
      units: {:string, :generic}
    ]
  end
end
