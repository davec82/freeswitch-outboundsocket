defmodule App.Mixfile do
  use Mix.Project

  def project do
    [
      app: :event_socket_outbound,
      version: "0.1.0",
      elixir: "~> 1.5",
      #build_path: "../../_build",
      #config_path: "../../config/config.exs",
      #deps_path: "../../deps",
      #lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test, "coveralls.detail": :test,
        "coveralls.post": :test, "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.8.10"},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:ranch, "~> 1.4"},
      {:excoveralls, "~> 0.7.5", only: :test}
    ]
  end
end
