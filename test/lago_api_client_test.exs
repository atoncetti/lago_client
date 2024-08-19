defmodule LagoApiClientTest do
  use ExUnit.Case
  doctest LagoApiClient

  test "greets the world" do
    assert LagoApiClient.hello() == :world
  end
end
