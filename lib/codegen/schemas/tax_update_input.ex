defmodule LagoApiClient.TaxUpdateInput do
  @moduledoc """
  Provides struct and type for a TaxUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, tax: LagoApiClient.TaxUpdateInputTax.t()}

  defstruct [:__info__, :tax]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tax: {LagoApiClient.TaxUpdateInputTax, :t}]
  end
end
