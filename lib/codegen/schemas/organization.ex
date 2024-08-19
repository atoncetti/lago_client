defmodule LagoApiClient.Organization do
  @moduledoc """
  Provides struct and type for a Organization
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{__info__: map, organization: LagoApiClient.OrganizationObject.t()}

  defstruct [:__info__, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: {LagoApiClient.OrganizationObject, :t}]
  end
end
