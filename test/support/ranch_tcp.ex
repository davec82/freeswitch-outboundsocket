defmodule EventSocketOutbound.Test.RanchTcp do
  def send(pid, data) do
    parsed_command = parse_data(data)
    Kernel.send(pid, parsed_command)
    :ok
  end

  def setopts(_socket, _opts) do
    :ok
  end

  def close(_socket) do
    :ok
  end

  defp parse_data(data) do
    cond do
      String.match?(data, ~r/connect\n\n/) ->
        :connect

      String.match?(data, ~r/myevents\n\n/) ->
        :myevents

      String.match?(data, ~r/event plain CHANNEL_EXECUTE_COMPLETE\n\n/) ->
        :eventplain

      String.match?(data, ~r/execute-app-name: answer/) ->
        :answer

      String.match?(data, ~r/execute-app-name: conference/) ->
        :conference

      String.match?(data, ~r/execute-app-name: hangup/) ->
        :hangup

      String.match?(data, ~r/execute-app-name: voicemail\n/) ->
        :execute

      String.match?(
        data,
        ~r/api uuid_dump 538c7d22-e705-11e7-bc33-73bec77e82ec/
      ) ->
        :api

      String.match?(
        data,
        ~r/filter Unique-ID 4192e98c-e569-11e7-b747-73bec77e82ec/
      ) ->
        :filter

      String.match?(data, ~r/linger/) ->
        :linger

      true ->
        :unknown
    end
  end
end
