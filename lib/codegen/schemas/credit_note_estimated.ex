defmodule LagoApiClient.CreditNoteEstimated do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimated
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          estimated_credit_note: LagoApiClient.CreditNoteEstimatedEstimatedCreditNote.t()
        }

  defstruct [:__info__, :estimated_credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [estimated_credit_note: {LagoApiClient.CreditNoteEstimatedEstimatedCreditNote, :t}]
  end
end
