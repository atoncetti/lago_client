defmodule LagoApiClient.CreditObjectItem do
  @moduledoc """
  Provides struct and type for a CreditObjectItem
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code: String.t(),
          lago_item_id: String.t(),
          name: String.t(),
          type: String.t()
        }

  defstruct [:__info__, :code, :lago_item_id, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      lago_item_id: {:string, :uuid},
      name: {:string, :generic},
      type: {:enum, ["coupon", "credit_note"]}
    ]
  end
end
