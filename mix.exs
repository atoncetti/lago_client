defmodule LagoClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :lago_client,
      version: "1.22.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2", optional: true},
      {:httpoison, "~> 2.2"},
      {:oapi_generator, "~> 0.2.0", only: :dev, runtime: false},
      {:telemetry, "~> 1.2"}
    ]
  end
end
