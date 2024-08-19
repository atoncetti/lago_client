defmodule LagoApiClient.FeesPaginated do
  @moduledoc """
  Provides struct and type for a FeesPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          fees: [LagoApiClient.FeeObject.t()] | nil,
          meta: LagoApiClient.PaginationMeta.t() | nil
        }

  defstruct [:__info__, :fees, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fees: [{LagoApiClient.FeeObject, :t}], meta: {LagoApiClient.PaginationMeta, :t}]
  end
end
