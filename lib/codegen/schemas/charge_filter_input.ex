defmodule LagoApiClient.ChargeFilterInput do
  @moduledoc """
  Provides struct and type for a ChargeFilterInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          invoice_display_name: String.t() | nil,
          properties: LagoApiClient.ChargeFilterInputProperties.t() | nil,
          values: LagoApiClient.ChargeFilterInputValues.t() | nil
        }

  defstruct [:__info__, :invoice_display_name, :properties, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      invoice_display_name: {:string, :generic},
      properties: {LagoApiClient.ChargeFilterInputProperties, :t},
      values: {LagoApiClient.ChargeFilterInputValues, :t}
    ]
  end
end
