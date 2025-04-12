defmodule LagoClient.InvoicePreviewInputSubscriptions do
  @moduledoc """
  Provides struct and type for a InvoicePreviewInputSubscriptions
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          external_ids: [String.t()],
          plan_code: String.t() | nil,
          terminated_at: DateTime.t() | nil
        }

  defstruct [:__info__, :external_ids, :plan_code, :terminated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_ids: [string: :generic],
      plan_code: {:string, :generic},
      terminated_at: {:string, :date_time}
    ]
  end
end
