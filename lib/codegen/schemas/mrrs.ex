defmodule LagoClient.Mrrs do
  @moduledoc """
  Provides struct and type for a Mrrs
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, mrrs: [LagoClient.MrrObject.t()]}

  defstruct [:__info__, :mrrs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mrrs: [{LagoClient.MrrObject, :t}]]
  end
end
