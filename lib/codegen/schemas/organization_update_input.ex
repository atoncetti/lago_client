defmodule LagoClient.OrganizationUpdateInput do
  @moduledoc """
  Provides struct and type for a OrganizationUpdateInput
  """
  use LagoClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          organization: LagoClient.OrganizationUpdateInputOrganization.t()
        }

  defstruct [:__info__, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: {LagoClient.OrganizationUpdateInputOrganization, :t}]
  end
end
