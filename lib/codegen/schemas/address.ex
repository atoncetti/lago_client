defmodule LagoApiClient.Address do
  @moduledoc """
  Provides struct and type for a Address
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          city: String.t() | nil,
          country: LagoApiClient.AddressCountry.t() | nil,
          state: String.t() | nil,
          zipcode: String.t() | nil
        }

  defstruct [:__info__, :address_line1, :address_line2, :city, :country, :state, :zipcode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      address_line1: {:string, :generic},
      address_line2: {:string, :generic},
      city: {:string, :generic},
      country: {LagoApiClient.AddressCountry, :t},
      state: {:string, :generic},
      zipcode: {:string, :generic}
    ]
  end
end
