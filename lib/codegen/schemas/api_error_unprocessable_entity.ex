defmodule LagoApiClient.ApiErrorUnprocessableEntity do
  @moduledoc """
  Provides struct and type for a ApiErrorUnprocessableEntity
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code: String.t(),
          error: String.t(),
          error_details: map,
          status: integer
        }

  defstruct [:__info__, :code, :error, :error_details, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {:string, :generic}, error: {:string, :generic}, error_details: :map, status: :integer]
  end
end
