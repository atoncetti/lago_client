defmodule LagoClient.CreditNotes do
  @moduledoc """
  Provides API endpoints related to credit notes
  """
  use LagoClient.Encoder

  @default_client LagoClient.Client

  @doc """
  Create a credit note

  This endpoint creates a new credit note.
  """
  @spec create_credit_note(LagoClient.CreditNoteCreateInput.t(), keyword) ::
          {:ok, LagoClient.CreditNote.t()} | {:error, LagoClient.Error.t()}
  def create_credit_note(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.CreditNotes, :create_credit_note},
      url: "/credit_notes",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.CreditNoteCreateInput, :t}}],
      response: [
        {200, {LagoClient.CreditNote, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Download a credit note PDF

  This endpoint downloads the PDF of an existing credit note.
  """
  @spec download_credit_note(String.t(), keyword) ::
          {:ok, LagoClient.CreditNote.t()} | {:error, LagoClient.Error.t()}
  def download_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.CreditNotes, :download_credit_note},
      url: "/credit_notes/#{lago_id}/download",
      method: :post,
      response: [
        {200, {LagoClient.CreditNote, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Estimate amounts for a new credit note

  This endpoint allows you to retrieve amounts for a new credit note creation.
  """
  @spec estimate_credit_note(LagoClient.CreditNoteEstimateInput.t(), keyword) ::
          {:ok, LagoClient.CreditNoteEstimated.t()} | {:error, LagoClient.Error.t()}
  def estimate_credit_note(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.CreditNotes, :estimate_credit_note},
      url: "/credit_notes/estimate",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.CreditNoteEstimateInput, :t}}],
      response: [
        {200, {LagoClient.CreditNoteEstimated, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
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
    * `issuing_date_from`: Filter credit notes starting from a specific date.
    * `issuing_date_to`: Filter credit notes up to a specific date.
    * `search_term`: Search credit notes by id, number, customer name, customer external_id or customer email.
    * `currency`: Filter credit notes by currency. Possible values ISO 4217 currency codes.
    * `reason`: Filter credit notes by reasons. Possible values are `product_unsatisfactory`, `order_change`, `order_cancellation`, `fraudulent_charge`, `duplicated_charge` or `other`.
    * `credit_status`: Filter credit notes by credit status. Possible values are `available`, `consumed`  or `voided`.
    * `refund_status`: Filter credit notes by refund status. Possible values are `pending`, `succeeded`  or `failed`.
    * `invoice_number`: Filter credit notes by their related invoice number.
    * `amount_from`: Filter credit notes of at least a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `amount_to`: Filter credit notes up to a specific amount. This parameter must be defined in cents to ensure consistent handling for all currency types.
    * `self_billed`: Filter credit notes belonging to a self billed invoice. Possible values are `true` or `false`.

  """
  @spec find_all_credit_notes(keyword) :: {:ok, map} | {:error, LagoClient.Error.t()}
  def find_all_credit_notes(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :amount_from,
        :amount_to,
        :credit_status,
        :currency,
        :external_customer_id,
        :invoice_number,
        :issuing_date_from,
        :issuing_date_to,
        :page,
        :per_page,
        :reason,
        :refund_status,
        :search_term,
        :self_billed
      ])

    client.request(%{
      args: [],
      call: {LagoClient.CreditNotes, :find_all_credit_notes},
      url: "/credit_notes",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.CreditNotes, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a credit note

  This endpoint retrieves an existing credit note.
  """
  @spec find_credit_note(String.t(), keyword) ::
          {:ok, LagoClient.CreditNote.t()} | {:error, LagoClient.Error.t()}
  def find_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.CreditNotes, :find_credit_note},
      url: "/credit_notes/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoClient.CreditNote, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a credit note

  This endpoint updates an existing credit note.
  """
  @spec update_credit_note(String.t(), LagoClient.CreditNoteUpdateInput.t(), keyword) ::
          {:ok, LagoClient.CreditNote.t()} | {:error, LagoClient.Error.t()}
  def update_credit_note(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {LagoClient.CreditNotes, :update_credit_note},
      url: "/credit_notes/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.CreditNoteUpdateInput, :t}}],
      response: [
        {200, {LagoClient.CreditNote, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Void available credit

  This endpoint voids the available credit linked to a specific credit note.
  """
  @spec void_credit_note(String.t(), keyword) ::
          {:ok, LagoClient.CreditNote.t()} | {:error, LagoClient.Error.t()}
  def void_credit_note(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.CreditNotes, :void_credit_note},
      url: "/credit_notes/#{lago_id}/void",
      method: :put,
      response: [
        {200, {LagoClient.CreditNote, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {405, {LagoClient.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{__info__: map, credit_notes: [LagoClient.CreditNoteObject.t()]}

  defstruct [:__info__, :credit_notes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [credit_notes: [{LagoClient.CreditNoteObject, :t}]]
  end
end
