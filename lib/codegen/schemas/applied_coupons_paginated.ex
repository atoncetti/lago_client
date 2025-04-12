defmodule LagoClient.AppliedCouponsPaginated do
  @moduledoc """
  Provides struct and type for a AppliedCouponsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_coupons: [LagoClient.AppliedCouponObjectExtended.t()],
          meta: LagoClient.PaginationMeta.t()
        }

  defstruct [:__info__, :applied_coupons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_coupons: [{LagoClient.AppliedCouponObjectExtended, :t}],
      meta: {LagoClient.PaginationMeta, :t}
    ]
  end
end
