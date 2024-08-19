defmodule LagoApiClient.CreditNotes do
  @moduledoc """
  Provides API endpoints related to credit notes
  """
  use LagoApiClient.Encoder

  @default_client LagoApiClient.Client

  @doc """
  Create a credit note

  This endpoint creates a new credit note.
  """
  @spec create_credit_note(LagoApiClient.CreditNoteCreateInput.t(), keyword) ::
          {:ok, LagoApiClient.CreditNote.t()} | {:error, LagoApiClient.Error.t()}
  def create_credit_note(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.CreditNotes, :create_credit_note},
      url: "/credit_notes",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.CreditNoteCreateInput, :t}}],
      response: [
        {200, {LagoApiClient.CreditNote, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Download a credit note PDF

  This endpoint downloads the PDF of an existing credit note.
  """
  @spec download_credit_note(String.t(), keyword) ::
          {:ok, LagoApiClient.CreditNote.t()} | {:error, LagoApiClient.Error.t()}
  def download_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.CreditNotes, :download_credit_note},
      url: "/credit_notes/#{lago_id}/download",
      method: :post,
      response: [
        {200, {LagoApiClient.CreditNote, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Estimate amounts for a new credit note

  This endpoint allows you to retrieve amounts for a new credit note creation.
  """
  @spec estimate_credit_note(LagoApiClient.CreditNoteEstimateInput.t(), keyword) ::
          {:ok, LagoApiClient.CreditNoteEstimated.t()} | {:error, LagoApiClient.Error.t()}
  def estimate_credit_note(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.CreditNotes, :estimate_credit_note},
      url: "/credit_notes/estimate",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.CreditNoteEstimateInput, :t}}],
      response: [
        {200, {LagoApiClient.CreditNoteEstimated, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all credit notes

  This endpoint list all existing credit notes.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: Unique identifier assigned to the customer in your application.

  """
  @spec find_all_credit_notes(keyword) :: {:ok, map} | {:error, LagoApiClient.Error.t()}
  def find_all_credit_notes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :per_page])

    client.request(%{
      args: [],
      call: {LagoApiClient.CreditNotes, :find_all_credit_notes},
      url: "/credit_notes",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.CreditNotes, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a credit note

  This endpoint retrieves an existing credit note.
  """
  @spec find_credit_note(String.t(), keyword) ::
          {:ok, LagoApiClient.CreditNote.t()} | {:error, LagoApiClient.Error.t()}
  def find_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.CreditNotes, :find_credit_note},
      url: "/credit_notes/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoApiClient.CreditNote, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a credit note

  This endpoint updates an existing credit note.
  """
  @spec update_credit_note(String.t(), LagoApiClient.CreditNoteUpdateInput.t(), keyword) ::
          {:ok, LagoApiClient.CreditNote.t()} | {:error, LagoApiClient.Error.t()}
  def update_credit_note(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {LagoApiClient.CreditNotes, :update_credit_note},
      url: "/credit_notes/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoApiClient.CreditNoteUpdateInput, :t}}],
      response: [
        {200, {LagoApiClient.CreditNote, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Void available credit

  This endpoint voids the available credit linked to a specific credit note.
  """
  @spec void_credit_note(String.t(), keyword) ::
          {:ok, LagoApiClient.CreditNote.t()} | {:error, LagoApiClient.Error.t()}
  def void_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.CreditNotes, :void_credit_note},
      url: "/credit_notes/#{lago_id}/void",
      method: :put,
      response: [
        {200, {LagoApiClient.CreditNote, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {405, {LagoApiClient.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{__info__: map, credit_notes: [LagoApiClient.CreditNoteObject.t()]}

  defstruct [:__info__, :credit_notes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_notes: [{LagoApiClient.CreditNoteObject, :t}]]
  end
end
