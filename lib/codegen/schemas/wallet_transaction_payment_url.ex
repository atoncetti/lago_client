defmodule LagoClient.WalletTransactionPaymentUrl do
  @moduledoc """
  Provides struct and type for a WalletTransactionPaymentUrl
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          wallet_transaction_payment_details:
            LagoClient.WalletTransactionPaymentUrlWalletTransactionPaymentDetails.t() | nil
        }

  defstruct [:__info__, :wallet_transaction_payment_details]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      wallet_transaction_payment_details:
        {LagoClient.WalletTransactionPaymentUrlWalletTransactionPaymentDetails, :t}
    ]
  end
end
