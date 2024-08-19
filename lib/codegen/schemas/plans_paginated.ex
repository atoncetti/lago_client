defmodule LagoApiClient.PlansPaginated do
  @moduledoc """
  Provides struct and type for a PlansPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoApiClient.PaginationMeta.t(),
          plans: [LagoApiClient.PlanObject.t()]
        }

  defstruct [:__info__, :meta, :plans]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoApiClient.PaginationMeta, :t}, plans: [{LagoApiClient.PlanObject, :t}]]
  end
end
