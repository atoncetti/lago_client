defmodule LagoClient.PaymentsPaginated do
  @moduledoc """
  Provides struct and type for a PaymentsPaginated
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          meta: LagoClient.PaginationMeta.t(),
          payments: [LagoClient.PaymentManualObject.t()]
        }

  defstruct [:__info__, :meta, :payments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [meta: {LagoClient.PaginationMeta, :t}, payments: [{LagoClient.PaymentManualObject, :t}]]
  end
end
