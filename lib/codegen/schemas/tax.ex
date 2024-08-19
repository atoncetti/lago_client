defmodule LagoApiClient.Tax do
  @moduledoc """
  Provides struct and type for a Tax
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, tax: LagoApiClient.TaxObject.t()}

  defstruct [:__info__, :tax]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tax: {LagoApiClient.TaxObject, :t}]
  end
end
