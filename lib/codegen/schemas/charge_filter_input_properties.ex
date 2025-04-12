defmodule LagoClient.ChargeFilterInputProperties do
  @moduledoc """
  Provides struct and type for a ChargeFilterInputProperties
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount: String.t() | nil,
          fixed_amount: String.t() | nil,
          free_units: integer | nil,
          free_units_per_events: integer | nil,
          free_units_per_total_aggregation: String.t() | nil,
          graduated_percentage_ranges: [map] | nil,
          graduated_ranges: [map] | nil,
          grouped_by: [String.t()] | nil,
          package_size: integer | nil,
          per_transaction_max_amount: String.t() | nil,
          per_transaction_min_amount: String.t() | nil,
          rate: String.t() | nil,
          volume_ranges: [map] | nil
        }

  defstruct [
    :__info__,
    :amount,
    :fixed_amount,
    :free_units,
    :free_units_per_events,
    :free_units_per_total_aggregation,
    :graduated_percentage_ranges,
    :graduated_ranges,
    :grouped_by,
    :package_size,
    :per_transaction_max_amount,
    :per_transaction_min_amount,
    :rate,
    :volume_ranges
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {:string, :generic},
      fixed_amount: {:string, :generic},
      free_units: :integer,
      free_units_per_events: :integer,
      free_units_per_total_aggregation: {:string, :generic},
      graduated_percentage_ranges: [:map],
      graduated_ranges: [:map],
      grouped_by: [string: :generic],
      package_size: :integer,
      per_transaction_max_amount: {:string, :generic},
      per_transaction_min_amount: {:string, :generic},
      rate: {:string, :generic},
      volume_ranges: [:map]
    ]
  end
end
