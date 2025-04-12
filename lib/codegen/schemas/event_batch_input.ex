defmodule LagoClient.EventBatchInput do
  @moduledoc """
  Provides struct and type for a EventBatchInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, events: [LagoClient.EventInputObject.t()]}

  defstruct [:__info__, :events]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [events: [{LagoClient.EventInputObject, :t}]]
  end
end
