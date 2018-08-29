defmodule EventSocketOutbound.Test do
  @moduledoc false

  use ExUnit.Case, async: true
  alias EventSocketOutbound.Protocol, as: EventProtocol
  alias EventSocketOutbound.Test.Support.SoftswitchEvent

  setup_all do
    call_mgt()
    :ok
  end

  describe "public api" do
    test "use custom listener port" do
      ref = make_ref()
      {:ok, _} = EventSocketOutbound.start(port: 5080, ref: ref)
      assert :ranch.get_port(ref) == 5080
      :ok = :ranch.stop_listener(ref)
    end

    test "use custom acceptors number" do
      ref = make_ref()
      {:ok, _} = EventSocketOutbound.start(acceptors: 25, ref: ref)
      infos = :ranch.info()
      {^ref, options} = Enum.at(infos, 0)
      assert options[:num_acceptors] == 25
      :ok = :ranch.stop_listener(ref)
    end
  end

  describe "send commands and receive events" do
    test "eventplain command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.eventplain(conn_pid, "CHANNEL_EXECUTE_COMPLETE")
        send(test_pid, %{user_pid: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :eventplain, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.command_reply()})
      end)

      assert_receive %{user_pid: :ok}, 5000
    end

    test "parse event plain" do
      # Event channel state
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)
      send(conn_pid, {:tcp, "socket", SoftswitchEvent.channel_state_header()})
      send(conn_pid, {:tcp, "socket", SoftswitchEvent.channel_state()})
      assert_receive %{event: %{"Event-Name" => "CHANNEL_STATE"}}, 5000
    end

    test "parse fake event" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)
      send(conn_pid, {:tcp, "socket", "fake\nevent\n\n"})
    end

    test "connect command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.connect(conn_pid)
        send(test_pid, %{connect: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :connect, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.channel_data()})
      end)

      assert_receive %{connect: :ok}, 5000
    end

    test "myevents command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.myevents(conn_pid)
        send(test_pid, %{myevents: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :myevents, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.command_reply()})
      end)

      assert_receive %{myevents: :ok}, 5000
    end

    test "answer command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.answer(conn_pid)
        send(test_pid, %{answer: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :answer, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.command_reply()})
      end)

      assert_receive %{answer: :ok}, 5000
    end

    test "conference command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.conference(conn_pid, "admin:example@default")
        send(test_pid, %{conference: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :conference, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.command_reply()})
      end)

      assert_receive %{conference: :ok}, 5000
    end

    test "hangup command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.hangup(conn_pid)
        send(test_pid, %{hangup: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :hangup, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.command_reply()})
      end)

      assert_receive %{hangup: :ok}, 5000
    end

    test "execute command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.execute(conn_pid, "voicemail", "default $${domain} 1000")
        send(test_pid, %{execute: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :execute, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.command_reply()})
      end)

      assert_receive %{execute: :ok}, 5000
    end

    test "api command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.api(
          conn_pid,
          "uuid_dump",
          "538c7d22-e705-11e7-bc33-73bec77e82ec"
        )

        send(test_pid, %{api: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :api, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.api_response()})
      end)

      assert_receive %{api: :ok}, 5000
    end

    test "filter command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.filter(
          conn_pid,
          "Unique-ID 4192e98c-e569-11e7-b747-73bec77e82ec"
        )

        send(test_pid, %{filter: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :filter, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.command_reply()})
      end)

      assert_receive %{filter: :ok}, 5000
    end

    test "linger command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)

      Task.start(fn ->
        EventProtocol.linger(conn_pid)
        send(test_pid, %{linger: :ok})
        :timer.sleep(:infinity)
      end)

      assert_receive :linger, 5000

      Task.start(fn ->
        send(conn_pid, {:tcp, "socket", SoftswitchEvent.command_reply()})
      end)

      assert_receive %{linger: :ok}, 5000
    end

    test "tcp connection closed" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)
      Process.flag(:trap_exit, true)
      ref = Process.monitor(conn_pid)
      send(conn_pid, {:tcp_closed, "socket"})
      assert_receive {:DOWN, ^ref, :process, _, _}, 5000
    end

    test "disconnect event" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)
      Process.flag(:trap_exit, true)
      ref = Process.monitor(conn_pid)
      send(conn_pid, {:tcp, "socket", SoftswitchEvent.disconnect_header()})
      send(conn_pid, {:tcp, "socket", SoftswitchEvent.disconnect()})
      assert_receive {:DOWN, ^ref, :process, _, _}, 5000
    end

    test "receive disconnect event before reply a command" do
      test_pid = load_call_mgt_module()
      conn_pid = start_protocol_server(test_pid)
      Process.flag(:trap_exit, true)

      Task.start(fn ->
        {:error, _} = EventProtocol.answer(conn_pid)
        send(test_pid, %{answer: :error})
        :timer.sleep(:infinity)
      end)

      assert_receive :answer, 5000
      send(conn_pid, {:tcp, "socket", SoftswitchEvent.disconnect_header()})
      send(conn_pid, {:tcp, "socket", SoftswitchEvent.disconnect()})
      assert_receive %{answer: :error}, 5000
    end
  end

  defp start_protocol_server(test_pid) do
    {:ok, conn_pid} =
      EventProtocol.start_link(
        "ref",
        test_pid,
        EventSocketOutbound.Test.RanchTcp,
        EventSocketOutbound.Test.Ranch
      )

    conn_pid
  end

  defp load_call_mgt_module() do
    test_pid = self()
    Application.put_env(:event_socket_outbound, :test_pid, test_pid)
    test_pid
  end

  defp call_mgt() do
    defmodule Call do
      use GenServer

      def start_link(pid) do
        GenServer.start_link(__MODULE__, {pid})
      end

      def onEvent(pid, event) do
        GenServer.cast(pid, {:event, event})
      end

      def init({pid}) do
        test_pid = Application.get_env(:event_socket_outbound, :test_pid, nil)
        {:ok, %{:tcp_server => pid, :test_pid => test_pid}}
      end

      @doc false
      def handle_cast({:event, event}, state) do
        send(state.test_pid, %{event: event})
        {:noreply, state}
      end
    end
  end
end
