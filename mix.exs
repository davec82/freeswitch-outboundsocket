defmodule App.Mixfile do
  use Mix.Project

  @version "0.4.0"

  def project do
    [
      app: :event_socket_outbound,
      version: @version,
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      aliases: aliases(),
      source_url: "https://github.com/davec82/freeswitch-outboundsocket",
      docs: [
        source_ref: "v#{@version}",
        canonical: "http://hexdocs.pm/event_socket_outbound",
        source_url: "https://github.com/davec82/freeswitch-outboundsocket"
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:credo, "~> 1.0", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:ranch, "~> 2.0"},
      {:ex_doc, "~> 0.19", only: :docs, runtime: false},
      {:inch_ex, "~> 0.5", only: :docs},
      {:excoveralls, "~> 0.10", only: :test},
      {:stream_data, "~> 0.3", only: :test}
    ]
  end

  defp description() do
    "An Elixir protocol for the FreeSWITCH's Event Socket, providing support for outbound method."
  end

  defp package() do
    [
      maintainers: ["Davide Colombo"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/davec82/freeswitch-outboundsocket"
      }
    ]
  end

  defp aliases do
    ["test.ci": &test_ci/1]
  end

  defp test_ci(args) do
    args =
      if IO.ANSI.enabled?(), do: ["--color" | args], else: ["--no-color" | args]

    args =
      if System.get_env("TRAVIS_SECURE_ENV_VARS") == "true",
        do: ["--include=integration" | args],
        else: args

    {_, res} =
      System.cmd(
        "mix",
        ["test" | args],
        into: IO.binstream(:stdio, :line),
        env: [{"MIX_ENV", "test"}]
      )

    if res > 0 do
      System.at_exit(fn _ -> exit({:shutdown, 1}) end)
    end
  end
end
