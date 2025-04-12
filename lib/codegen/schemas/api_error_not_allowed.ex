defmodule LagoClient.ApiErrorNotAllowed do
  @moduledoc """
  Provides struct and type for a ApiErrorNotAllowed
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, code: String.t(), error: String.t(), status: integer}

  defstruct [:__info__, :code, :error, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {:string, :generic}, error: {:string, :generic}, status: :integer]
  end
end
