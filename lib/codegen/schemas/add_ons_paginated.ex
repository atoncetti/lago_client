defmodule LagoClient.AddOnsPaginated do
  @moduledoc """
  Provides struct and type for a AddOnsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          add_ons: [LagoClient.AddOnObject.t()],
          meta: LagoClient.PaginationMeta.t()
        }

  defstruct [:__info__, :add_ons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [add_ons: [{LagoClient.AddOnObject, :t}], meta: {LagoClient.PaginationMeta, :t}]
  end
end
