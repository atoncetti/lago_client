defmodule LagoClient.ChargePropertiesVolumeRanges do
  @moduledoc """
  Provides struct and type for a ChargePropertiesVolumeRanges
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          flat_amount: String.t(),
          from_value: integer,
          per_unit_amount: String.t(),
          to_value: integer | nil
        }

  defstruct [:__info__, :flat_amount, :from_value, :per_unit_amount, :to_value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flat_amount: {:string, :generic},
      from_value: :integer,
      per_unit_amount: {:string, :generic},
      to_value: {:union, [:integer, :null]}
    ]
  end
end
