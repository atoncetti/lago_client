defmodule LagoClient.InvoicePreviewInput do
  @moduledoc """
  Provides struct and type for a InvoicePreviewInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billing_time: String.t() | nil,
          coupons: [LagoClient.InvoicePreviewInputCoupons.t()] | nil,
          customer: LagoClient.InvoicePreviewInputCustomer.t(),
          plan_code: String.t() | nil,
          subscription_at: DateTime.t() | nil,
          subscriptions: LagoClient.InvoicePreviewInputSubscriptions.t() | nil
        }

  defstruct [
    :__info__,
    :billing_time,
    :coupons,
    :customer,
    :plan_code,
    :subscription_at,
    :subscriptions
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      billing_time: {:enum, ["calendar", "anniversary"]},
      coupons: [{LagoClient.InvoicePreviewInputCoupons, :t}],
      customer: {LagoClient.InvoicePreviewInputCustomer, :t},
      plan_code: {:string, :generic},
      subscription_at: {:string, :date_time},
      subscriptions: {LagoClient.InvoicePreviewInputSubscriptions, :t}
    ]
  end
end
