defmodule LagoApiClient.MinimumCommitmentObject do
  @moduledoc """
  Provides struct and type for a MinimumCommitmentObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          created_at: DateTime.t(),
          interval: String.t() | nil,
          invoice_display_name: String.t() | nil,
          lago_id: String.t(),
          plan_code: String.t() | nil,
          taxes: [LagoApiClient.TaxObject.t()] | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :amount_cents,
    :created_at,
    :interval,
    :invoice_display_name,
    :lago_id,
    :plan_code,
    :taxes,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      created_at: {:string, :date_time},
      interval: {:enum, ["weekly", "monthly", "quarterly", "yearly"]},
      invoice_display_name: {:string, :generic},
      lago_id: {:string, :uuid},
      plan_code: {:string, :generic},
      taxes: [{LagoApiClient.TaxObject, :t}],
      updated_at: {:string, :date_time}
    ]
  end
end
