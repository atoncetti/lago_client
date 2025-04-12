defmodule LagoClient.AddOnUpdateInput do
  @moduledoc """
  Provides struct and type for a AddOnUpdateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, add_on: LagoClient.AddOnBaseInput.t()}

  defstruct [:__info__, :add_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [add_on: {LagoClient.AddOnBaseInput, :t}]
  end
end
