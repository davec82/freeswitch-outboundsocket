defmodule EventSocketOutbound.Protocol do
  use GenServer
  @moduledoc """
  Protocol handler starts a connection process and defines logic for FreeSWITCH events and protocol.
  """
  @behaviour :ranch_protocol

  @doc """
  Once the connection is accepted, run this command in order to get all information about  the call.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/Event+Socket+Outbound#EventSocketOutbound-UsingNetcat).
  """
  @spec connect(pid) :: term
  def connect(pid) do
    GenServer.call(pid, {:connect})
  end

  #def auth(pid, args) do
  #  GenServer.call(pid, {{:auth}, {args}})
  #end

  @doc """
  Filtered events will come to the app.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/mod_event_socket#mod_event_socket-filter).
  """
  @spec filter(pid, String.t) :: term
  def filter(pid, args) do
    GenServer.call(pid, {{:filter}, {args}})
  end

  @doc """
  Not to close the socket connect when a channel hangs up.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/mod_event_socket#mod_event_socket-linger).
  """
  @spec linger(pid, String.t) :: term
  def linger(pid, args \\ "") do
    GenServer.call(pid, {{:linger}, {args}})
  end

  @doc """
  Enable or disable events by class or all.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/mod_event_socket#mod_event_socket-event).
  """
  @spec eventplain(pid, String.t) :: term
  def eventplain(pid, args) do
    GenServer.call(pid, {{:eventplain}, {args}})
  end

  @doc """
  It will "lock on" to the events for a particular uuid and will ignore all other events.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/mod_event_socket#mod_event_socket-SpecialCase-'myevents').
  """
  @spec myevents(pid) :: term
  def myevents(pid) do
    GenServer.call(pid, {:myevents})
  end

  @doc """
  Execute a dialplan application, and wait for a response from the server.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/mod_event_socket#mod_event_socket-execute).
  """
  @spec execute(pid, String.t, String.t) :: term
  def execute(pid, command, args) do
    GenServer.call(pid, {{:execute}, {command, args}})
  end

  @doc """
  Send an api command.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/mod_event_socket#mod_event_socket-api).
  """
  @spec api(pid, String.t, String.t) :: term
  def api(pid, command, args) do
    GenServer.call(pid, {{:api}, {command, args}})
  end

  @doc """
  Send a conference command.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/mod_conference#mod_conference-ConferenceDialplanApplication).
  """
  @spec conference(pid, String.t) :: term
  def conference(pid, args) do
    GenServer.call(pid, {{:conference}, {args}})
  end

  @doc """
  Hangs the call.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/Event+Socket+Outbound).
  """
  @spec hangup(pid, String.t) :: term
  def hangup(pid, reason \\ "") do
    GenServer.call(pid, {{:hangup}, {reason}})
  end

  @doc """
  Answers the call.
  For further details, refer to  FreeSWITCH [docs](https://freeswitch.org/confluence/display/FREESWITCH/Event+Socket+Outbound#EventSocketOutbound-UsingNetcat).
  """
  @spec answer(pid) :: term
  def answer(pid) do
    GenServer.call(pid, {:answer})
  end

  @spec start_link(reference, any, module, any) :: {:ok, pid}
  def start_link(ref, socket, transport, module_protocol) do
    pid = :proc_lib.spawn_link(__MODULE__, :init,
      [ref, socket, transport, module_protocol])
    {:ok, pid}
  end

  @doc false
  def init(ref, socket, transport, module_protocol) do
    :ok = module_protocol.accept_ack(ref)
    :ok = transport.setopts(socket, [:binary, packet: :raw, active: true])
    config = Application.get_env(:event_socket_outbound,
      EventSocketOutbound.Call.Manager, [])
    call_mgt_adapter = config[:call_mgt_adapter] || EventSocketOutbound.ExampleCallMgmt
    {:ok, call_mgt} = call_mgt_adapter.start_link(self())
    :gen_server.enter_loop(__MODULE__, [], %{cmds: [], buffer: "",
      socket: socket, transport: transport, call_mgt: call_mgt,
      call_mgt_adapter: call_mgt_adapter})
  end

  def handle_call({{:execute}, {command, args}}, from, %{cmds: cmds} = state) do
    sendmsg(state, command, args: args, lock: "true")
    {:noreply, %{state | cmds: cmds ++ [{from, "execute"}]}}
  end

  def handle_call({{:api}, {command, args}}, from, %{cmds: cmds} = state) do
    sendcmd(state, "api " <> command <> " " <> args)
    {:noreply, %{state | cmds: cmds ++ [{from, "api"}]}}
  end

  def handle_call({{:hangup}, {reason}}, from, %{cmds: cmds} = state) do
    cmd = Atom.to_string(:hangup)
    sendmsg(state, cmd, args: reason, lock: "true")
    {:noreply, %{state | cmds: cmds ++ [{from, cmd}]}}
  end

  def handle_call({{:conference}, {reason}}, from, %{cmds: cmds} = state) do
    cmd = Atom.to_string(:conference)
    sendmsg(state, cmd, args: reason, lock: "true")
    {:noreply, %{state | cmds: cmds ++ [{from, cmd}]}}
  end

  def handle_call({:connect}, from, %{cmds: cmds} = state) do
    cmd = Atom.to_string(:connect)
    sendcmd(state, cmd)
    {:noreply, %{state | cmds: cmds ++ [{from, cmd}]}}
  end

  def handle_call({:myevents}, from, %{cmds: cmds} = state) do
    cmd = Atom.to_string(:myevents)
    sendcmd(state, cmd)
    {:noreply, %{state | cmds: cmds ++ [{from, cmd}]}}
  end

  def handle_call({{:linger}, {args}}, from, %{cmds: cmds} = state) do
    sendcmd(state, "linger " <> args)
    {:noreply, %{state | cmds: cmds ++ [{from, "linger"}]}}
  end

  def handle_call({{:filter}, {args}}, from, %{cmds: cmds} = state) do
    sendcmd(state, "filter " <> args)
    {:noreply, %{state | cmds: cmds ++ [{from, "filter"}]}}
  end

  #def handle_call({{:auth}, {args}}, from, %{cmds: cmds} = state) do
  #  sendcmd(state, "auth " <> args)
  #  {:noreply, %{state | cmds: cmds ++ [{from, "filter"}]}}
  #end

  def handle_call({{:eventplain}, {args}}, from, %{cmds: cmds} = state) do
    sendcmd(state, "event plain " <> args)
    {:noreply, %{state | cmds: cmds ++ [{from, "eventplain"}]}}
  end

  def handle_call({:answer}, from, %{cmds: cmds} = state) do
    cmd = Atom.to_string(:answer)
    sendmsg(state, cmd, lock: "true")
    {:noreply, %{state | cmds: cmds ++ [{from, cmd}]}}
  end

  def handle_info({:tcp, _sock, data}, %{buffer: buffer} = state) do
    aux_buffer = buffer <> data

    case String.contains?(aux_buffer, "\n\n") do
      true ->
        [data, new_buffer] = String.split(aux_buffer, "\n\n", parts: 2)

        case String.contains?(aux_buffer, "Content-Length") do
          true ->
            [_match|[content_length]] = Regex.run(~r/Content-Length: (\d+)\n/,
              aux_buffer)
            content_length = :erlang.binary_to_integer(content_length)

            case String.length(new_buffer) >= content_length do
              true ->
                {body, new_buffer} = String.split_at(new_buffer, content_length)
                event =  parse_event(data, body)
                response = event_cb(event, state)
                build_event_cb_response(response, new_buffer)
                #{response, %{new_state | buffer: new_buffer}}
              false ->
                {:noreply, %{state | buffer: aux_buffer}}
            end
          false ->
            decode_value = case String.contains?(data, "CHANNEL_DATA") do
                true -> true
                _ -> false
              end
            event = parse_key_value(data, decode_value)
            response = event_cb(event, state)
            build_event_cb_response(response, new_buffer)
            #{response, %{new_state | buffer: new_buffer}}
        end
      false ->
        {:noreply, %{state | buffer: aux_buffer}}
    end
  end

  def handle_info({:tcp_closed, _}, %{socket: socket, transport: transport} = state) do
    transport.close(socket)
    {:stop, :shutdown, state}
  end

  defp parse_event(data, body) do
    case String.contains?(data, ["text/disconnect-notice", "api/response"]) do
      true ->
        header_map = parse_key_value(data)
        body_map = parse_rawdata(body)
        Map.merge(header_map, body_map)
      false ->
        header_map = parse_key_value(data)
        body_map = parse_key_value(body)
        Map.merge(header_map, body_map)
    end

  end

  defp parse_key_value(data, decode_value \\ true) do
    values = data
      |> String.trim()
      |> String.replace(" ", "")
      |> String.split("\n")
    Enum.reduce(values, %{}, fn(v, acc) ->
      case String.split(v, ":") do
        [key, value] -> Map.put(acc, key, parse_value(value, decode_value))
        _ -> acc
      end
    end)
  end

  defp parse_value(value, decode_value) do
    case decode_value do
      true -> URI.decode_www_form(value)
      _ -> value
    end
  end

  defp parse_rawdata(data) do
    %{"rawresponse" => data}
  end

  defp build_event_cb_response({:noreply, state}, new_buffer) do
    {:noreply, %{state | buffer: new_buffer}}
  end

  defp build_event_cb_response({:stop, reason, state}, _) do
    {:stop, reason, state}
  end

  defp event_cb(%{"Content-Type" => "command/reply"} = event, state) do
    {cmd, new_cmds} = List.pop_at(state.cmds, 0)
    reply_text = Map.get(event, "Reply-Text")
    #Reply to client with status
    response = case String.starts_with?(reply_text, "+OK") do
        true -> :ok
        _ -> :error
      end
    GenServer.reply(elem(cmd, 0), {response, event})
    {:noreply, %{state | cmds: new_cmds}}
  end

  #defp event_cb(%{"Content-Type" => "auth/request"} = event, state) do
  #  {:noreply, state}
  #end

  defp event_cb(%{"Content-Type" => "api/response"} = event, state) do
    {cmd, new_cmds} = List.pop_at(state.cmds, 0)
    raw_response = Map.get(event, "rawresponse")
    response = case String.starts_with?(raw_response, "+OK") do
      true -> :ok
      _ -> :error
    end
    GenServer.reply(elem(cmd, 0), {response, event})
    {:noreply, %{state | cmds: new_cmds}}
  end
  defp event_cb(%{"Content-Type" => "text/event-plain"} = event, state) do
    call_mgt_adapter = state.call_mgt_adapter
    call_mgt_adapter.onEvent(state.call_mgt, event)
    {:noreply, state}
  end
  defp event_cb(%{"Content-Type" => "text/disconnect-notice"}, state) do
    Enum.each(state.cmds, fn(cmd) -> GenServer.reply(elem(cmd, 0), {:error, "text/disconnect-notice"}) end)
    {:stop, :shutdown, state}
  end
  defp event_cb(_event, state) do
    {:noreply, state}
  end

  defp sendcmd(state, cmd) do
    socket = state.socket
    transport = state.transport
    transport.send(socket, cmd <> "\n\n")
  end

  defp sendmsg(state, name, options) do
    defaults = [args: nil, uuid: "", lock: "false"]
    options = Keyword.merge(defaults, options) |> Enum.into(%{})
    %{args: args, uuid: uuid, lock: lock} = options
    transport = state.transport
    transport.send(state.socket, "sendmsg " <> uuid <> "\ncall-command: execute\n")
    transport.send(state.socket, "execute-app-name: " <> name <> "\n")
    unless is_nil(args), do: transport.send(state.socket, "execute-app-arg: " <> args <> "\n")
    transport.send(state.socket, "event-lock: " <> lock <> "\n")
    transport.send(state.socket, "\n\n")
  end
end
