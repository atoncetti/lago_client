defmodule LagoClient.CustomerPastUsage do
  @moduledoc """
  Provides struct and type for a CustomerPastUsage
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          usage_periods: [LagoClient.CustomerUsage.t()]
        }

  defstruct [:__info__, :meta, :usage_periods]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoClient.PaginationMeta, :t}, usage_periods: [{LagoClient.CustomerUsage, :t}]]
  end
end
