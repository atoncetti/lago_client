defmodule LagoApiClient.OrganizationUpdateInput do
  @moduledoc """
  Provides struct and type for a OrganizationUpdateInput
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          organization: LagoApiClient.OrganizationUpdateInputOrganization.t()
        }

  defstruct [:__info__, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: {LagoApiClient.OrganizationUpdateInputOrganization, :t}]
  end
end
