defmodule LagoClient.InvoicePreviewInputCustomerIntegrationCustomers do
  @moduledoc """
  Provides struct and type for a InvoicePreviewInputCustomerIntegrationCustomers
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          integration_code: String.t(),
          integration_type: String.t()
        }

  defstruct [:__info__, :integration_code, :integration_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [integration_code: {:string, :generic}, integration_type: {:const, "anrok"}]
  end
end
