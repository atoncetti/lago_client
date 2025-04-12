defmodule LagoClient.CreditNoteEstimateInput do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          credit_note: LagoClient.CreditNoteEstimateInputCreditNote.t()
        }

  defstruct [:__info__, :credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {LagoClient.CreditNoteEstimateInputCreditNote, :t}]
  end
end
