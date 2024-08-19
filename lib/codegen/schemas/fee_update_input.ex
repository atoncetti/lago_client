defmodule LagoApiClient.FeeUpdateInput do
  @moduledoc """
  Provides struct and type for a FeeUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, fee: LagoApiClient.FeeUpdateInputFee.t()}

  defstruct [:__info__, :fee]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fee: {LagoApiClient.FeeUpdateInputFee, :t}]
  end
end
