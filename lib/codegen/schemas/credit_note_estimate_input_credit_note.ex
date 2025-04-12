defmodule LagoClient.CreditNoteEstimateInputCreditNote do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimateInputCreditNote
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          invoice_id: String.t(),
          items: [LagoClient.CreditNoteEstimateInputCreditNoteItems.t()]
        }

  defstruct [:__info__, :invoice_id, :items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      invoice_id: {:string, :uuid},
      items: [{LagoClient.CreditNoteEstimateInputCreditNoteItems, :t}]
    ]
  end
end
