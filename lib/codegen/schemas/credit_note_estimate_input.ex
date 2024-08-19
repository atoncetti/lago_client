defmodule LagoApiClient.CreditNoteEstimateInput do
  @moduledoc """
  Provides struct and type for a CreditNoteEstimateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          credit_note: LagoApiClient.CreditNoteEstimateInputCreditNote.t()
        }

  defstruct [:__info__, :credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {LagoApiClient.CreditNoteEstimateInputCreditNote, :t}]
  end
end
