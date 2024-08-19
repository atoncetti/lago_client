defmodule LagoApiClient.TaxesPaginated do
  @moduledoc """
  Provides struct and type for a TaxesPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoApiClient.PaginationMeta.t(),
          taxes: [LagoApiClient.TaxObject.t()]
        }

  defstruct [:__info__, :meta, :taxes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoApiClient.PaginationMeta, :t}, taxes: [{LagoApiClient.TaxObject, :t}]]
  end
end
