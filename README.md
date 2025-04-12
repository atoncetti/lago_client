# LagoClient

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `lago_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lago_client, "~> 0.1.0"}
  ]
end
```

## Regenerate

- Copy all content of yaml from https://swagger.getlago.com/openapi.yaml to `priv/openapi.yaml`
- run `mix api.gen default priv/openapi.yaml`