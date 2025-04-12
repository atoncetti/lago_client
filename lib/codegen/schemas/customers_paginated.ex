defmodule LagoClient.CustomersPaginated do
  @moduledoc """
  Provides struct and type for a CustomersPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          customers: [LagoClient.CustomerObjectExtended.t()],
          meta: LagoClient.PaginationMeta.t()
        }

  defstruct [:__info__, :customers, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customers: [{LagoClient.CustomerObjectExtended, :t}], meta: {LagoClient.PaginationMeta, :t}]
  end
end
