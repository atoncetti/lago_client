defmodule LagoClient.InvoiceCustomSectionObject do
  @moduledoc """
  Provides struct and type for a InvoiceCustomSectionObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_to_organization: boolean | nil,
          code: String.t(),
          created_at: DateTime.t() | nil,
          description: String.t() | nil,
          details: String.t() | nil,
          display_name: String.t() | nil,
          lago_id: String.t(),
          name: String.t(),
          organization_id: String.t() | nil
        }

  defstruct [
    :__info__,
    :applied_to_organization,
    :code,
    :created_at,
    :description,
    :details,
    :display_name,
    :lago_id,
    :name,
    :organization_id
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
      details: {:string, :generic},
      display_name: {:string, :generic},
      lago_id: {:string, :uuid},
      name: {:string, :generic},
      organization_id: {:string, :uuid}
    ]
  end
end
