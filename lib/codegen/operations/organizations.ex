defmodule LagoClient.Organizations do
  @moduledoc """
  Provides API endpoint related to organizations
  """

  @default_client LagoClient.Client

  @doc """
  Update your organization

  This endpoint is used to update your own organization's settings.
  """
  @spec update_organization(LagoClient.OrganizationUpdateInput.t(), keyword) ::
          {:ok, LagoClient.Organization.t()} | {:error, LagoClient.Error.t()}
  def update_organization(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Organizations, :update_organization},
      url: "/organizations",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.OrganizationUpdateInput, :t}}],
      response: [
        {200, {LagoClient.Organization, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
