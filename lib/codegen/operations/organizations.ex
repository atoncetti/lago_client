defmodule LagoApiClient.Organizations do
  @moduledoc """
  Provides API endpoint related to organizations
  """

  @default_client LagoApiClient.Client

  @doc """
  Update your organization

  This endpoint is used to update your own organization's settings.
  """
  @spec update_organization(LagoApiClient.OrganizationUpdateInput.t(), keyword) ::
          {:ok, LagoApiClient.Organization.t()} | {:error, LagoApiClient.Error.t()}
  def update_organization(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.Organizations, :update_organization},
      url: "/organizations",
      body: body,
      method: :put,
      request: [{"application/json", {LagoApiClient.OrganizationUpdateInput, :t}}],
      response: [
        {200, {LagoApiClient.Organization, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
