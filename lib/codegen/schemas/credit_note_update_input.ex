defmodule LagoApiClient.CreditNoteUpdateInput do
  @moduledoc """
  Provides struct and type for a CreditNoteUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          credit_note: LagoApiClient.CreditNoteUpdateInputCreditNote.t()
        }

  defstruct [:__info__, :credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {LagoApiClient.CreditNoteUpdateInputCreditNote, :t}]
  end
end
