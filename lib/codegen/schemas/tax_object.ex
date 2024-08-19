defmodule LagoApiClient.TaxObject do
  @moduledoc """
  Provides struct and type for a TaxObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          add_ons_count: integer | nil,
          applied_to_organization: boolean,
          charges_count: integer | nil,
          code: String.t(),
          created_at: DateTime.t(),
          customers_count: integer,
          description: String.t() | nil,
          lago_id: String.t(),
          name: String.t(),
          plans_count: integer | nil,
          rate: number
        }

  defstruct [
    :__info__,
    :add_ons_count,
    :applied_to_organization,
    :charges_count,
    :code,
    :created_at,
    :customers_count,
    :description,
    :lago_id,
    :name,
    :plans_count,
    :rate
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      add_ons_count: :integer,
      applied_to_organization: :boolean,
      charges_count: :integer,
      code: {:string, :generic},
      created_at: {:string, :date_time},
      customers_count: :integer,
      description: {:string, :generic},
      lago_id: {:string, :uuid},
      name: {:string, :generic},
      plans_count: :integer,
      rate: :number
    ]
  end
end
