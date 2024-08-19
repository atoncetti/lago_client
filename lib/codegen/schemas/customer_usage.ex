defmodule LagoApiClient.CustomerUsage do
  @moduledoc """
  Provides struct and type for a CustomerUsage
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, customer_usage: LagoApiClient.CustomerUsageObject.t()}

  defstruct [:__info__, :customer_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer_usage: {LagoApiClient.CustomerUsageObject, :t}]
  end
end
