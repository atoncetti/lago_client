defmodule LagoClient.InvoiceObjectExtended do
  @moduledoc """
  Provides struct and type for a InvoiceObjectExtended
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          credits: [LagoClient.CreditObject.t()] | nil,
          error_details: [LagoClient.ErrorDetailObject.t()] | nil,
          fees: [LagoClient.FeeObject.t()] | nil,
          subscriptions: [LagoClient.SubscriptionObject.t()] | nil
        }

  defstruct [:__info__, :credits, :error_details, :fees, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      credits: [{LagoClient.CreditObject, :t}],
      error_details: [{LagoClient.ErrorDetailObject, :t}],
      fees: [{LagoClient.FeeObject, :t}],
      subscriptions: [{LagoClient.SubscriptionObject, :t}]
    ]
  end
end
