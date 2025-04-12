defmodule LagoClient.PaymentObject do
  @moduledoc """
  Provides struct and type for a PaymentObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          external_id: String.t(),
          lago_customer_id: String.t(),
          lago_payable_id: String.t(),
          next_action: map,
          payment_provider_code: String.t() | nil,
          payment_provider_type: String.t(),
          provider_customer_id: String.t(),
          provider_payment_id: String.t(),
          status: String.t()
        }

  defstruct [
    :__info__,
    :external_id,
    :lago_customer_id,
    :lago_payable_id,
    :next_action,
    :payment_provider_code,
    :payment_provider_type,
    :provider_customer_id,
    :provider_payment_id,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_id: {:string, :generic},
      lago_customer_id: {:string, :uuid},
      lago_payable_id: {:string, :uuid},
      next_action: :map,
      payment_provider_code: {:string, :generic},
      payment_provider_type: {:enum, ["adyen", "cashfree", "gocardless", "stripe"]},
      provider_customer_id: {:string, :generic},
      provider_payment_id: {:string, :generic},
      status: {:string, :generic}
    ]
  end
end
