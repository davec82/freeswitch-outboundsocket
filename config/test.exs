use Mix.Config

config :event_socket_outbound, EventSocketOutbound.Call.Manager,
  call_mgt_adapter: EventSocketOutbound.Test.Call
