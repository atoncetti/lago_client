defmodule LagoClient.FeeObjectItem do
  @moduledoc """
  Provides struct and type for a FeeObjectItem
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code: String.t(),
          filter_invoice_display_name: String.t() | nil,
          filters: LagoClient.FeeObjectItemFilters.t() | nil,
          grouped_by: LagoClient.FeeObjectItemGroupedBy.t() | nil,
          invoice_display_name: String.t() | nil,
          item_type: String.t(),
          lago_item_id: String.t(),
          name: String.t(),
          type: String.t()
        }

  defstruct [
    :__info__,
    :code,
    :filter_invoice_display_name,
    :filters,
    :grouped_by,
    :invoice_display_name,
    :item_type,
    :lago_item_id,
    :name,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      filter_invoice_display_name: {:string, :generic},
      filters: {LagoClient.FeeObjectItemFilters, :t},
      grouped_by: {LagoClient.FeeObjectItemGroupedBy, :t},
      invoice_display_name: {:string, :generic},
      item_type: {:enum, ["AddOn", "BillableMetric", "Subscription", "WalletTransaction"]},
      lago_item_id: {:string, :uuid},
      name: {:string, :generic},
      type: {:enum, ["charge", "add_on", "subscription", "credit"]}
    ]
  end
end
