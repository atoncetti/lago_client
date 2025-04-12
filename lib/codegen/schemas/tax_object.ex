defmodule LagoClient.TaxObject do
  @moduledoc """
  Provides struct and type for a TaxObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_to_organization: boolean,
          code: String.t(),
          created_at: DateTime.t(),
          description: String.t() | nil,
          lago_id: String.t(),
          name: String.t(),
          rate: number
        }

  defstruct [
    :__info__,
    :applied_to_organization,
    :code,
    :created_at,
    :description,
    :lago_id,
    :name,
    :rate
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_to_organization: :boolean,
      code: {:string, :generic},
      created_at: {:string, :date_time},
      description: {:string, :generic},
      lago_id: {:string, :uuid},
      name: {:string, :generic},
      rate: :number
    ]
  end
end
