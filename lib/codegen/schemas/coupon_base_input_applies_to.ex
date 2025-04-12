defmodule LagoClient.CouponBaseInputAppliesTo do
  @moduledoc """
  Provides struct and type for a CouponBaseInputAppliesTo
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable_metric_codes: [String.t()] | nil,
          plan_codes: [String.t()] | nil
        }

  defstruct [:__info__, :billable_metric_codes, :plan_codes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billable_metric_codes: {:union, [[string: :generic], :null]},
      plan_codes: {:union, [[string: :generic], :null]}
    ]
  end
end
