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

    :ranch.start_listener(
      ref,
      acceptors,
      :ranch_tcp,
      [{:port, port}],
      EventSocketOutbound.Protocol,
      :ranch
    )
  end
end
