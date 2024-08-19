defmodule LagoApiClient.EventObjectProperties do
  @moduledoc """
  Provides struct and type for a EventObjectProperties
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, operation_type: String.t() | nil}

  defstruct [:__info__, :operation_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [operation_type: {:enum, ["add", "remove"]}]
  end
end
