defmodule LagoClient.Event do
  @moduledoc """
  Provides struct and type for a Event
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, event: LagoClient.EventObject.t()}

  defstruct [:__info__, :event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: {LagoClient.EventObject, :t}]
  end
end
