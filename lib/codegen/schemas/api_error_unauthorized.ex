defmodule LagoClient.ApiErrorUnauthorized do
  @moduledoc """
  Provides struct and type for a ApiErrorUnauthorized
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, error: String.t(), status: integer}

  defstruct [:__info__, :error, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error: {:string, :generic}, status: :integer]
  end
end
