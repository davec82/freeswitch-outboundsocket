defmodule EventSocketOutbound.CallMgmt do
  @moduledoc false
  @callback start_link(pid()) :: {:ok, pid()} | :ignore | {:error, {:already_started, pid()} | term()}
  @callback onEvent(pid(), map()) :: term()
end
