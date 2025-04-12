defmodule LagoClient.FeesPaginated do
  @moduledoc """
  Provides struct and type for a FeesPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          fees: [LagoClient.FeeObject.t()] | nil,
          meta: LagoClient.PaginationMeta.t() | nil
        }

  defstruct [:__info__, :fees, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fees: [{LagoClient.FeeObject, :t}], meta: {LagoClient.PaginationMeta, :t}]
  end
end
