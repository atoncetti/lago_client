defmodule LagoClient.CustomerCheckoutUrl do
  @moduledoc """
  Provides struct and type for a CustomerCheckoutUrl
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          customer: LagoClient.CustomerCheckoutUrlCustomer.t() | nil
        }

  defstruct [:__info__, :customer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customer: {LagoClient.CustomerCheckoutUrlCustomer, :t}]
  end
end
