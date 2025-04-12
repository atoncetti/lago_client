defmodule LagoClient.PaymentRequestCreateInputPaymentRequest do
  @moduledoc """
  Provides struct and type for a PaymentRequestCreateInputPaymentRequest
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          email: String.t(),
          external_customer_id: String.t(),
          lago_invoice_ids: [String.t()]
        }

  defstruct [:__info__, :email, :external_customer_id, :lago_invoice_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :email},
      external_customer_id: {:string, :generic},
      lago_invoice_ids: [string: :generic]
    ]
  end
end
