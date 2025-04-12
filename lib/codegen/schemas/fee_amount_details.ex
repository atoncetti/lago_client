defmodule LagoClient.FeeAmountDetails do
  @moduledoc """
  Provides struct and type for a FeeAmountDetails
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          fixed_fee_total_amount: String.t() | nil,
          fixed_fee_unit_amount: String.t() | nil,
          free_events: integer | nil,
          free_units: String.t() | nil,
          graduated_percentage_ranges:
            [LagoClient.FeeAmountDetailsGraduatedPercentageRanges.t()] | nil,
          graduated_ranges: [LagoClient.FeeAmountDetailsGraduatedRanges.t()] | nil,
          min_max_adjustment_total_amount: String.t() | nil,
          paid_events: integer | nil,
          paid_units: String.t() | nil,
          per_package_size: integer | nil,
          per_package_unit_amount: String.t() | nil,
          per_unit_total_amount: String.t() | nil,
          rate: String.t() | nil,
          units: String.t() | nil,
          volume_ranges: [LagoClient.FeeAmountDetailsVolumeRanges.t()] | nil
        }

  defstruct [
    :__info__,
    :fixed_fee_total_amount,
    :fixed_fee_unit_amount,
    :free_events,
    :free_units,
    :graduated_percentage_ranges,
    :graduated_ranges,
    :min_max_adjustment_total_amount,
    :paid_events,
    :paid_units,
    :per_package_size,
    :per_package_unit_amount,
    :per_unit_total_amount,
    :rate,
    :units,
    :volume_ranges
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fixed_fee_total_amount: {:string, :generic},
      fixed_fee_unit_amount: {:string, :generic},
      free_events: :integer,
      free_units: {:string, :generic},
      graduated_percentage_ranges: [{LagoClient.FeeAmountDetailsGraduatedPercentageRanges, :t}],
      graduated_ranges: [{LagoClient.FeeAmountDetailsGraduatedRanges, :t}],
      min_max_adjustment_total_amount: {:string, :generic},
      paid_events: :integer,
      paid_units: {:string, :generic},
      per_package_size: :integer,
      per_package_unit_amount: {:string, :generic},
      per_unit_total_amount: {:string, :generic},
      rate: {:string, :generic},
      units: {:string, :generic},
      volume_ranges: [{LagoClient.FeeAmountDetailsVolumeRanges, :t}]
    ]
  end
end
