defmodule LagoClient.OrganizationBillingConfiguration do
  @moduledoc """
  Provides struct and type for a OrganizationBillingConfiguration
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          document_locale: String.t() | nil,
          invoice_footer: String.t() | nil,
          invoice_grace_period: integer | nil
        }

  defstruct [:__info__, :document_locale, :invoice_footer, :invoice_grace_period]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      document_locale: {:string, :generic},
      invoice_footer: {:union, [{:string, :generic}, :null]},
      invoice_grace_period: :integer
    ]
  end
end
