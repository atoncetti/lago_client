defmodule LagoApiClient.EventInput do
  @moduledoc """
  Provides struct and type for a EventInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, event: map}

  defstruct [:__info__, :event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: :map]
  end
end
