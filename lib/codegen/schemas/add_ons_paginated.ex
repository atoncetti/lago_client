defmodule LagoApiClient.AddOnsPaginated do
  @moduledoc """
  Provides struct and type for a AddOnsPaginated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          add_ons: [LagoApiClient.AddOnObject.t()],
          meta: LagoApiClient.PaginationMeta.t()
        }

  defstruct [:__info__, :add_ons, :meta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [add_ons: [{LagoApiClient.AddOnObject, :t}], meta: {LagoApiClient.PaginationMeta, :t}]
  end
end
