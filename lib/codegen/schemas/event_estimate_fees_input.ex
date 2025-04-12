defmodule LagoClient.EventEstimateFeesInput do
  @moduledoc """
  Provides struct and type for a EventEstimateFeesInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, event: LagoClient.EventEstimateFeesInputEvent.t()}

  defstruct [:__info__, :event]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [event: {LagoClient.EventEstimateFeesInputEvent, :t}]
  end
end
