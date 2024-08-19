defmodule LagoApiClient.Wallets do
  @moduledoc """
  Provides API endpoints related to wallets
  """

  @default_client LagoApiClient.Client

  @doc """
  Create a wallet

  This endpoint is used to create a wallet with prepaid credits.
  """
  @spec create_wallet(LagoApiClient.WalletCreateInput.t(), keyword) ::
          {:ok, LagoApiClient.Wallet.t()} | {:error, LagoApiClient.Error.t()}
  def create_wallet(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.Wallets, :create_wallet},
      url: "/wallets",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.WalletCreateInput, :t}}],
      response: [
        {200, {LagoApiClient.Wallet, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Top up a wallet

  This endpoint is used to top-up an active wallet.
  """
  @spec create_wallet_transaction(LagoApiClient.WalletTransactionCreateInput.t(), keyword) ::
          {:ok, LagoApiClient.WalletTransactions.t()} | {:error, LagoApiClient.Error.t()}
  def create_wallet_transaction(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoApiClient.Wallets, :create_wallet_transaction},
      url: "/wallet_transactions",
      body: body,
      method: :post,
      request: [{"application/json", {LagoApiClient.WalletTransactionCreateInput, :t}}],
      response: [
        {200, {LagoApiClient.WalletTransactions, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Terminate a wallet

  This endpoint is used to terminate an existing wallet with prepaid credits.
  """
  @spec destroy_wallet(String.t(), keyword) ::
          {:ok, LagoApiClient.Wallet.t()} | {:error, LagoApiClient.Error.t()}
  def destroy_wallet(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.Wallets, :destroy_wallet},
      url: "/wallets/#{lago_id}",
      method: :delete,
      response: [
        {200, {LagoApiClient.Wallet, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {405, {LagoApiClient.ApiErrorNotAllowed, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all wallet transactions

  This endpoint is used to list all wallet transactions.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `status`: The status of the wallet transaction. Possible values are `pending` or `settled`.
    * `transaction_status`: The transaction status of the wallet transaction. Possible values are `purchased` (with pending or settled status), `granted` (without invoice_id), `voided` or `invoiced`.
    * `transaction_type`: The transaction type of the wallet transaction. Possible values are `inbound` (increasing the wallet balance) or `outbound` (decreasing the wallet balance).

  """
  @spec find_all_wallet_transactions(String.t(), keyword) ::
          {:ok, LagoApiClient.WalletTransactionsPaginated.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_wallet_transactions(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:page, :per_page, :status, :transaction_status, :transaction_type])

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.Wallets, :find_all_wallet_transactions},
      url: "/wallets/#{lago_id}/wallet_transactions",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.WalletTransactionsPaginated, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List all wallets

  This endpoint is used to list all wallets with prepaid credits.

  ## Options

    * `page`: Page number.
    * `per_page`: Number of records per page.
    * `external_customer_id`: The customer external unique identifier (provided by your own application).

  """
  @spec find_all_wallets(keyword) ::
          {:ok, LagoApiClient.WalletsPaginated.t()} | {:error, LagoApiClient.Error.t()}
  def find_all_wallets(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :per_page])

    client.request(%{
      args: [],
      call: {LagoApiClient.Wallets, :find_all_wallets},
      url: "/wallets",
      method: :get,
      query: query,
      response: [
        {200, {LagoApiClient.WalletsPaginated, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a wallet

  This endpoint is used to retrieve an existing wallet with prepaid credits.
  """
  @spec find_wallet(String.t(), keyword) ::
          {:ok, LagoApiClient.Wallet.t()} | {:error, LagoApiClient.Error.t()}
  def find_wallet(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoApiClient.Wallets, :find_wallet},
      url: "/wallets/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoApiClient.Wallet, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a wallet

  This endpoint is used to update an existing wallet with prepaid credits.
  """
  @spec update_wallet(String.t(), LagoApiClient.WalletUpdateInput.t(), keyword) ::
          {:ok, LagoApiClient.Wallet.t()} | {:error, LagoApiClient.Error.t()}
  def update_wallet(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {LagoApiClient.Wallets, :update_wallet},
      url: "/wallets/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoApiClient.WalletUpdateInput, :t}}],
      response: [
        {200, {LagoApiClient.Wallet, :t}},
        {400, {LagoApiClient.ApiErrorBadRequest, :t}},
        {401, {LagoApiClient.ApiErrorUnauthorized, :t}},
        {404, {LagoApiClient.ApiErrorNotFound, :t}},
        {422, {LagoApiClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
