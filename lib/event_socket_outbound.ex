defmodule EventSocketOutbound do
  def start_link(port \\ 8084) do
    ref = make_ref()
    :ranch.start_listener(ref, :ranch_tcp, [{:port, port}],
      EventSocketOutbound.Protocol, :ranch)
  end
end
