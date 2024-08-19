defmodule LagoApiClient.CustomerPastUsage do
  @moduledoc """
  Provides struct and type for a CustomerPastUsage
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoApiClient.PaginationMeta.t(),
          usage_periods: [LagoApiClient.CustomerUsage.t()]
        }

  defstruct [:__info__, :meta, :usage_periods]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoApiClient.PaginationMeta, :t}, usage_periods: [{LagoApiClient.CustomerUsage, :t}]]
  end
end
