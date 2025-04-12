defmodule LagoClient.PaginationMeta do
  @moduledoc """
  Provides struct and type for a PaginationMeta
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          current_page: integer,
          next_page: integer | nil,
          prev_page: integer | nil,
          total_count: integer,
          total_pages: integer
        }

  defstruct [:__info__, :current_page, :next_page, :prev_page, :total_count, :total_pages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      current_page: :integer,
      next_page: {:union, [:integer, :null]},
      prev_page: {:union, [:integer, :null]},
      total_count: :integer,
      total_pages: :integer
    ]
  end
end
