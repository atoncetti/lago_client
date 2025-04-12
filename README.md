# LagoClient

Elixir client library to communicate with a [Lago](https://www.getlago.com/) server.

- [Lago API Documentation](https://docs.getlago.com/welcome)

## Installation

The package can be installed by adding `lago_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
      {:lago_client, git: "https://github.com/atoncetti/lago_client.git"}
  ]
end
```

## Regenerate

- Copy content of yaml from https://swagger.getlago.com/openapi.yaml to `priv/openapi.yaml`
- run `mix api.gen default priv/openapi.yaml`