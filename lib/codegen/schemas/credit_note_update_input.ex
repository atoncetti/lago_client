defmodule LagoClient.CreditNoteUpdateInput do
  @moduledoc """
  Provides struct and type for a CreditNoteUpdateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          credit_note: LagoClient.CreditNoteUpdateInputCreditNote.t()
        }

  defstruct [:__info__, :credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {LagoClient.CreditNoteUpdateInputCreditNote, :t}]
  end
end
