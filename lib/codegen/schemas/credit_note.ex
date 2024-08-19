defmodule LagoApiClient.CreditNote do
  @moduledoc """
  Provides struct and type for a CreditNote
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, credit_note: LagoApiClient.CreditNoteObject.t()}

  defstruct [:__info__, :credit_note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_note: {LagoApiClient.CreditNoteObject, :t}]
  end
end
