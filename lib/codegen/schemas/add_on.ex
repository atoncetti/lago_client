defmodule LagoClient.AddOn do
  @moduledoc """
  Provides struct and type for a AddOn
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, add_on: LagoClient.AddOnObject.t()}

  defstruct [:__info__, :add_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [add_on: {LagoClient.AddOnObject, :t}]
  end
end
