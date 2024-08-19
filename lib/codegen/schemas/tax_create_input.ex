defmodule LagoApiClient.TaxCreateInput do
  @moduledoc """
  Provides struct and type for a TaxCreateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, tax: LagoApiClient.TaxCreateInputTax.t()}

  defstruct [:__info__, :tax]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tax: {LagoApiClient.TaxCreateInputTax, :t}]
  end
end
