defmodule LagoApiClient.Event do
  @moduledoc """
  Provides struct and type for a Event
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, event: LagoApiClient.EventObject.t()}

  defstruct [:__info__, :event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: {LagoApiClient.EventObject, :t}]
  end
end
