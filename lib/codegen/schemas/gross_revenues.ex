defmodule LagoApiClient.GrossRevenues do
  @moduledoc """
  Provides struct and type for a GrossRevenues
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, gross_revenues: [LagoApiClient.GrossRevenueObject.t()]}

  defstruct [:__info__, :gross_revenues]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gross_revenues: [{LagoApiClient.GrossRevenueObject, :t}]]
  end
end
