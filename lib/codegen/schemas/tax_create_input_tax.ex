defmodule LagoClient.TaxCreateInputTax do
  @moduledoc """
  Provides struct and type for a TaxCreateInputTax
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          applied_to_organization: boolean | nil,
          code: String.t() | nil,
          description: String.t() | nil,
          name: String.t() | nil,
          rate: String.t() | nil
        }

  defstruct [:__info__, :applied_to_organization, :code, :description, :name, :rate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_to_organization: :boolean,
      code: {:string, :generic},
      description: {:string, :generic},
      name: {:string, :generic},
      rate: {:string, :generic}
    ]
  end
end
