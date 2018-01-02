defmodule EventSocketOutbound do
  def start_link(opts \\ []) do
    port = Keyword.get(opts, :port, 8084)
    acceptors = Keyword.get(opts, :acceptors, 10)
    ref = Keyword.get(opts, :ref, make_ref())
    :ranch.start_listener(ref, acceptors, :ranch_tcp, [{:port, port}],
      EventSocketOutbound.Protocol, :ranch)
  end
end
