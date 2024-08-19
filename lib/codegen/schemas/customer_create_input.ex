defmodule LagoApiClient.CustomerCreateInput do
  @moduledoc """
  Provides struct and type for a CustomerCreateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, customer: LagoApiClient.CustomerCreateInputCustomer.t()}

  defstruct [:__info__, :customer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer: {LagoApiClient.CustomerCreateInputCustomer, :t}]
  end
end
