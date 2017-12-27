defmodule App.Mixfile do
  use Mix.Project

  def project do
    [
      app: :event_socket_outbound,
      version: "0.1.0",
      #build_path: "../../_build",
      #config_path: "../../config/config.exs",
      #deps_path: "../../deps",
      #lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test, "coveralls.detail": :test,
        "coveralls.post": :test, "coveralls.html": :test
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:credo, "~> 0.8.10"},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:ranch, "~> 1.4"},
      {:inch_ex, "~> 0.5", only: :docs},
      {:excoveralls, "~> 0.7.5", only: :test}
    ]
  end

  defp aliases do
    ["test.ci": &test_ci/1]
  end

  defp test_ci(args) do
    args = if IO.ANSI.enabled?, do: ["--color"|args], else: ["--no-color"|args]
    args = if System.get_env("TRAVIS_SECURE_ENV_VARS") == "true", do: ["--include=integration"|args], else: args

    {_, res} = System.cmd("mix",
                          ["test"|args],
                          into: IO.binstream(:stdio, :line),
                          env: [{"MIX_ENV", "test"}])

    if res > 0 do
      System.at_exit(fn _ -> exit({:shutdown, 1}) end)
    end
  end
end
