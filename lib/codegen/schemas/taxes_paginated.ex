defmodule LagoClient.TaxesPaginated do
  @moduledoc """
  Provides struct and type for a TaxesPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          taxes: [LagoClient.TaxObject.t()]
        }

  defstruct [:__info__, :meta, :taxes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoClient.PaginationMeta, :t}, taxes: [{LagoClient.TaxObject, :t}]]
  end
end
