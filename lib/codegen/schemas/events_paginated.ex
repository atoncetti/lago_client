defmodule LagoClient.EventsPaginated do
  @moduledoc """
  Provides struct and type for a EventsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          events: [LagoClient.EventObject.t()],
          meta: LagoClient.PaginationMeta.t()
        }

  defstruct [:__info__, :events, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [events: [{LagoClient.EventObject, :t}], meta: {LagoClient.PaginationMeta, :t}]
  end
end
