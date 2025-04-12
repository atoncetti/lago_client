defmodule LagoClient.CreditNote do
  @moduledoc """
  Provides struct and type for a CreditNote
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{__info__: map, credit_note: LagoClient.CreditNoteObject.t()}

  defstruct [:__info__, :credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {LagoClient.CreditNoteObject, :t}]
  end
end
