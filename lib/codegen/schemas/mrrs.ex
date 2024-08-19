defmodule LagoApiClient.Mrrs do
  @moduledoc """
  Provides struct and type for a Mrrs
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, mrrs: [LagoApiClient.MrrObject.t()]}

  defstruct [:__info__, :mrrs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mrrs: [{LagoApiClient.MrrObject, :t}]]
  end
end
