defmodule LagoClient.CustomerUsage do
  @moduledoc """
  Provides struct and type for a CustomerUsage
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, customer_usage: LagoClient.CustomerUsageObject.t()}

  defstruct [:__info__, :customer_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer_usage: {LagoClient.CustomerUsageObject, :t}]
  end
end
