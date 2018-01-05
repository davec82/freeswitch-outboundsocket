defmodule EventSocketOutbound.CallMgmt do
  @moduledoc """
  Callbacks for module will define call routing.
  """
  @callback start_link(pid()) :: {:ok, pid()} | :ignore | {:error, {:already_started, pid()} | term()}
  @callback onEvent(pid(), map()) :: term()
end
