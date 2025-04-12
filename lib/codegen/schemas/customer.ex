defmodule LagoClient.Customer do
  @moduledoc """
  Provides struct and type for a Customer
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, customer: LagoClient.CustomerObjectExtended.t()}

  defstruct [:__info__, :customer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer: {LagoClient.CustomerObjectExtended, :t}]
  end
end
