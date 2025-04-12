defmodule LagoClient.Wallets do
  @moduledoc """
  Provides API endpoints related to wallets
  """

  @default_client LagoClient.Client

  @doc """
  Create a wallet

  This endpoint is used to create a wallet with prepaid credits.
  """
  @spec create_wallet(LagoClient.WalletCreateInput.t(), keyword) ::
          {:ok, LagoClient.Wallet.t()} | {:error, LagoClient.Error.t()}
  def create_wallet(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Wallets, :create_wallet},
      url: "/wallets",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.WalletCreateInput, :t}}],
      response: [
        {200, {LagoClient.Wallet, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Top up a wallet

  This endpoint is used to top-up an active wallet.
  """
  @spec create_wallet_transaction(LagoClient.WalletTransactionCreateInput.t(), keyword) ::
          {:ok, LagoClient.WalletTransactions.t()} | {:error, LagoClient.Error.t()}
  def create_wallet_transaction(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {LagoClient.Wallets, :create_wallet_transaction},
      url: "/wallet_transactions",
      body: body,
      method: :post,
      request: [{"application/json", {LagoClient.WalletTransactionCreateInput, :t}}],
      response: [
        {200, {LagoClient.WalletTransactions, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Terminate a wallet

  This endpoint is used to terminate an existing wallet with prepaid credits.
  """
  @spec destroy_wallet(String.t(), keyword) ::
          {:ok, LagoClient.Wallet.t()} | {:error, LagoClient.Error.t()}
  def destroy_wallet(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Wallets, :destroy_wallet},
      url: "/wallets/#{lago_id}",
      method: :delete,
      response: [
        {200, {LagoClient.Wallet, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {405, {LagoClient.ApiErrorNotAllowed, :t}}
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
          {:ok, LagoClient.WalletTransactionsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_wallet_transactions(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:page, :per_page, :status, :transaction_status, :transaction_type])

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Wallets, :find_all_wallet_transactions},
      url: "/wallets/#{lago_id}/wallet_transactions",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.WalletTransactionsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
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
          {:ok, LagoClient.WalletsPaginated.t()} | {:error, LagoClient.Error.t()}
  def find_all_wallets(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:external_customer_id, :page, :per_page])

    client.request(%{
      args: [],
      call: {LagoClient.Wallets, :find_all_wallets},
      url: "/wallets",
      method: :get,
      query: query,
      response: [
        {200, {LagoClient.WalletsPaginated, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a wallet

  This endpoint is used to retrieve an existing wallet with prepaid credits.
  """
  @spec find_wallet(String.t(), keyword) ::
          {:ok, LagoClient.Wallet.t()} | {:error, LagoClient.Error.t()}
  def find_wallet(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Wallets, :find_wallet},
      url: "/wallets/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoClient.Wallet, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve a wallet transaction

  This endpoint is used to retrieve a specific wallet transactions.
  """
  @spec find_wallet_transaction(String.t(), keyword) ::
          {:ok, LagoClient.WalletTransactionObject.t()} | {:error, LagoClient.Error.t()}
  def find_wallet_transaction(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Wallets, :find_wallet_transaction},
      url: "/wallet_transactions/#{lago_id}",
      method: :get,
      response: [
        {200, {LagoClient.WalletTransactionObject, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a wallet

  This endpoint is used to update an existing wallet with prepaid credits.
  """
  @spec update_wallet(String.t(), LagoClient.WalletUpdateInput.t(), keyword) ::
          {:ok, LagoClient.Wallet.t()} | {:error, LagoClient.Error.t()}
  def update_wallet(lago_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id, body: body],
      call: {LagoClient.Wallets, :update_wallet},
      url: "/wallets/#{lago_id}",
      body: body,
      method: :put,
      request: [{"application/json", {LagoClient.WalletUpdateInput, :t}}],
      response: [
        {200, {LagoClient.Wallet, :t}},
        {400, {LagoClient.ApiErrorBadRequest, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Generate a payment URL

  This endpoint generates a checkout link for a specific wallet transaction.
  """
  @spec wallet_transaction_payment_url(String.t(), keyword) ::
          {:ok, LagoClient.WalletTransactionPaymentUrl.t()} | {:error, LagoClient.Error.t()}
  def wallet_transaction_payment_url(lago_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [lago_id: lago_id],
      call: {LagoClient.Wallets, :wallet_transaction_payment_url},
      url: "/wallet_transactions/#{lago_id}/payment_url",
      method: :post,
      response: [
        {200, {LagoClient.WalletTransactionPaymentUrl, :t}},
        {401, {LagoClient.ApiErrorUnauthorized, :t}},
        {404, {LagoClient.ApiErrorNotFound, :t}},
        {422, {LagoClient.ApiErrorUnprocessableEntity, :t}}
      ],
      opts: opts
    })
  end
end
