defmodule LagoApiClient.AppliedCouponsPaginated do
  @moduledoc """
  Provides struct and type for a AppliedCouponsPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_coupons: [LagoApiClient.AppliedCouponObjectExtended.t()],
          meta: LagoApiClient.PaginationMeta.t()
        }

  defstruct [:__info__, :applied_coupons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_coupons: [{LagoApiClient.AppliedCouponObjectExtended, :t}],
      meta: {LagoApiClient.PaginationMeta, :t}
    ]
  end
end
