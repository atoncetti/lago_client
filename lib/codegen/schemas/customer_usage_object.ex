defmodule LagoApiClient.CustomerUsageObject do
  @moduledoc """
  Provides struct and type for a CustomerUsageObject
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          amount_cents: integer,
          charges_usage: [LagoApiClient.CustomerChargeUsageObject.t()],
          currency: LagoApiClient.CustomerUsageObjectCurrency.t() | nil,
          from_datetime: DateTime.t(),
          issuing_date: Date.t(),
          lago_invoice_id: String.t() | nil,
          taxes_amount_cents: integer,
          to_datetime: DateTime.t(),
          total_amount_cents: integer
        }

  defstruct [
    :__info__,
    :amount_cents,
    :charges_usage,
    :currency,
    :from_datetime,
    :issuing_date,
    :lago_invoice_id,
    :taxes_amount_cents,
    :to_datetime,
    :total_amount_cents
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount_cents: :integer,
      charges_usage: [{LagoApiClient.CustomerChargeUsageObject, :t}],
      currency: {LagoApiClient.CustomerUsageObjectCurrency, :t},
      from_datetime: {:string, :date_time},
      issuing_date: {:string, :date},
      lago_invoice_id: {:string, :uuid},
      taxes_amount_cents: :integer,
      to_datetime: {:string, :date_time},
      total_amount_cents: :integer
    ]
  end
end
