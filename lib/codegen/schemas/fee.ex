defmodule LagoApiClient.Fee do
  @moduledoc """
  Provides struct and type for a Fee
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, fee: LagoApiClient.FeeObject.t()}

  defstruct [:__info__, :fee]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fee: {LagoApiClient.FeeObject, :t}]
  end
end
