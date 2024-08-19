defmodule LagoApiClient.EventBatchInput do
  @moduledoc """
  Provides struct and type for a EventBatchInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, events: [map]}

  defstruct [:__info__, :events]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [events: [:map]]
  end
end
