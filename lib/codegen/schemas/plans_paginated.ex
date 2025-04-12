defmodule LagoClient.PlansPaginated do
  @moduledoc """
  Provides struct and type for a PlansPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          plans: [LagoClient.PlanObject.t()]
        }

  defstruct [:__info__, :meta, :plans]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoClient.PaginationMeta, :t}, plans: [{LagoClient.PlanObject, :t}]]
  end
end
