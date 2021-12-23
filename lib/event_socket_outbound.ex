defmodule EventSocketOutbound do
  @moduledoc """
  A wrapper to start a TCP listener suitable for FreeSWITCH event socket outbound.
  """

  @doc """
  Start a TCP listener which implements a protocol handler for FreeSwitch events and commands
  """
  def start(opts \\ []) do
    port = Keyword.get(opts, :port, 8084)
    acceptors = Keyword.get(opts, :acceptors, 10)
    ref = Keyword.get(opts, :ref, make_ref())
    socket_opts = [] |> maybe_use_random_port(port)

    :ranch.start_listener(
      ref,
      :ranch_tcp,
      %{num_acceptors: acceptors, socket_opts: socket_opts},
      EventSocketOutbound.Protocol,
      :ranch
    )
  end

  defp maybe_use_random_port(socket_opts, :random) do
    socket_opts
  end

  defp maybe_use_random_port(socket_opts, port) do
    [{:port, port} | socket_opts]
  end
end
