defmodule LagoApiClient.Customer do
  @moduledoc """
  Provides struct and type for a Customer
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, customer: LagoApiClient.CustomerObjectExtended.t()}

  defstruct [:__info__, :customer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer: {LagoApiClient.CustomerObjectExtended, :t}]
  end
end
