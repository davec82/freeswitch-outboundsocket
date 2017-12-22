defmodule EventSocketOutbound.ExampleCallMgmt do
  use GenServer
  alias EventSocketOutbound.Protocol, as: EventProtocol

  def start_link(pid) do
    GenServer.start_link(__MODULE__, {pid})
  end

  def onEvent(pid, event) do
    GenServer.cast(pid, {:event, event})
  end

  #
  # GenServer Callbacks
  #
  @doc false
  def init({pid}) do
    send(self(), :start_up)
    {:ok, %{:tcp_server => pid}}
  end

  @doc false
  def handle_cast({:event, %{"Event-Name" => "PLAYBACK_STOP"}}, state) do
    EventProtocol.hangup(state.tcp_server)
    {:noreply, state}
  end
  @doc false
  def handle_cast({:event, _event}, state) do
    {:noreply, state}
  end

  @doc false
  def handle_info(:start_up, state) do
    {:ok, data} = EventProtocol.connect(state.tcp_server)
    my_uuid = Map.get(data, "Channel-Unique-ID")
    {:ok, _} = EventProtocol.filter(state.tcp_server, "Unique-ID " <> my_uuid)
    {:ok, _} = EventProtocol.eventplain(state.tcp_server, "PLAYBACK_STOP")
    {:ok, _} = EventProtocol.answer(state.tcp_server)
    playback_args = "ivr/ivr-welcome.wav"
    {:ok, _} = EventProtocol.execute(state.tcp_server, "playback", playback_args)
    {:noreply, state}
  end
end
