defmodule LagoClient.CouponsPaginated do
  @moduledoc """
  Provides struct and type for a CouponsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          coupons: [LagoClient.CouponObject.t()],
          meta: LagoClient.PaginationMeta.t()
        }

  defstruct [:__info__, :coupons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupons: [{LagoClient.CouponObject, :t}], meta: {LagoClient.PaginationMeta, :t}]
  end
end
