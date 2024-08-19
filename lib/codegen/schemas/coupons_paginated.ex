defmodule LagoApiClient.CouponsPaginated do
  @moduledoc """
  Provides struct and type for a CouponsPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          coupons: [LagoApiClient.CouponObject.t()],
          meta: LagoApiClient.PaginationMeta.t()
        }

  defstruct [:__info__, :coupons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupons: [{LagoApiClient.CouponObject, :t}], meta: {LagoApiClient.PaginationMeta, :t}]
  end
end
