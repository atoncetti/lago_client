# LagoClient

Elixir client library to communicate with a [Lago](https://www.getlago.com/) server.

- [Lago API Documentation](https://docs.getlago.com/welcome)

## Installation

The package can be installed by adding `lago_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
      {:lago_client, git: "https://github.com/atoncetti/lago_client.git", branch: "main"}
  ]
end
```

## Regenerate

- Copy content of yaml from https://swagger.getlago.com/openapi.yaml to `priv/openapi.yaml`
- run `mix api.gen default priv/openapi.yaml`

## Use Example

Add to `config/runtime.exs`:

```elixir
config :lago_client,
  app_name: :your-app-name,
  auth:
    System.get_env(
      "LAGO_API_KEY",
      "your-api-key"
    ),
  server:
    System.get_env(
      "LAGO_API_URL",
      "http://localhost:3000/api/v1" # or url to your lago instance
    )
```

To use the library:

```elixir
alias LagoClient.Subscriptions
alias LagoClient.SubscriptionCreateInput
alias LagoClient.SubscriptionCreateInputSubscription

{:ok, subscription} = Subscriptions.create_subscription(%SubscriptionCreateInput{
  subscription: %SubscriptionCreateInputSubscription{
    external_id: "asdf1234",
    external_customer_id: "customer.12345",
    plan_code: "free"
  }
})
```

## Issues

- `CustomerObjectExtended` is of type allOf and is not properly build, manually add all fields from `CustomerObject`