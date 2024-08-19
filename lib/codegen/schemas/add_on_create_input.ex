defmodule LagoApiClient.AddOnCreateInput do
  @moduledoc """
  Provides struct and type for a AddOnCreateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, add_on: LagoApiClient.AddOnCreateInputAddOn.t()}

  defstruct [:__info__, :add_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [add_on: {LagoApiClient.AddOnCreateInputAddOn, :t}]
  end
end
