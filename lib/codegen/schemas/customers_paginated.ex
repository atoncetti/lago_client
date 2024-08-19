defmodule LagoApiClient.CustomersPaginated do
  @moduledoc """
  Provides struct and type for a CustomersPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          customers: [LagoApiClient.CustomerObjectExtended.t()],
          meta: LagoApiClient.PaginationMeta.t()
        }

  defstruct [:__info__, :customers, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customers: [{LagoApiClient.CustomerObjectExtended, :t}],
      meta: {LagoApiClient.PaginationMeta, :t}
    ]
  end
end
