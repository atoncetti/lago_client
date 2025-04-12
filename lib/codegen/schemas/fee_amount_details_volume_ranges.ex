defmodule LagoClient.FeeAmountDetailsVolumeRanges do
  @moduledoc """
  Provides struct and type for a FeeAmountDetailsVolumeRanges
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          flat_unit_amount: String.t(),
          per_unit_amount: String.t(),
          per_unit_total_amount: String.t()
        }

  defstruct [:__info__, :flat_unit_amount, :per_unit_amount, :per_unit_total_amount]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flat_unit_amount: {:string, :generic},
      per_unit_amount: {:string, :generic},
      per_unit_total_amount: {:string, :generic}
    ]
  end
end
