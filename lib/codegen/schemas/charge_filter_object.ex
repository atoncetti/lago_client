defmodule LagoClient.ChargeFilterObject do
  @moduledoc """
  Provides struct and type for a ChargeFilterObject
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          invoice_display_name: String.t() | nil,
          properties: LagoClient.ChargeProperties.t(),
          values: LagoClient.ChargeFilterObjectValues.t()
        }

  defstruct [:__info__, :invoice_display_name, :properties, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      invoice_display_name: {:union, [{:string, :generic}, :null]},
      properties: {LagoClient.ChargeProperties, :t},
      values: {LagoClient.ChargeFilterObjectValues, :t}
    ]
  end
end
