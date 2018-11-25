# Event Socket Outbound
[![Hex.pm](https://img.shields.io/hexpm/v/event_socket_outbound.svg)](https://hex.pm/packages/event_socket_outbound)
[![Build Status](https://travis-ci.org/davec82/freeswitch-outboundsocket.png?branch=master)](https://travis-ci.org/davec82/freeswitch-outboundsocket)
[![Coverage Status](https://coveralls.io/repos/github/davec82/freeswitch-outboundsocket/badge.svg?branch=master)](https://coveralls.io/github/davec82/freeswitch-outboundsocket?branch=master)

`EventSocketOutbound` is an Elixir protocol for the FreeSWITCH's Event Socket. This protocol provides support for Outbound method of the Event Socket.

## Installation

Add event_socket_outbound to your list of dependencies in `mix.exs`:

```elixir
    def deps do
      [{:event_socket_outbound, "~> 0.3.0"}]
    end
```
## Getting started

```elixir
# In your config/config.exs file
config :event_socket_outbound, EventSocketOutbound.Call.Manager,
  call_mgt_adapter: MySample.Call
```
where MySample.Call will be a module that implements EventSocketOutbound.CallMgmt behaviour and logic for controlling the call. By default `EventSocketOutbound` uses EventSocketOutbound.ExampleCallMgmt module which answers the call and play a welcome message.

## Usage

1. Start `EventSocketOutbound` without options.
```elixir
>Application.start(:ranch)
:ok
>EventSocketOutbound.start
{:ok, #PID<0.172.0>}
```

2. Start `EventSocketOutbound` with options.
```elixir
>Application.start(:ranch)
:ok
>EventSocketOutbound.start port: 8090, acceptors: 50
{:ok, #PID<0.174.0>}
```

3. Add the child specs to your supervision tree, using `EventSocketOutbound.Protocol` as protocol. For more info, refer to ranch [docs](https://ninenines.eu/docs/en/ranch/1.4/guide/embedded/).
```elixir
child_spec = :ranch.child_spec(ref, 10, :ranch_tcp, [{:port, 8084}], EventSocketOutbound.Protocol :ranch)
```

## Copyright and License

Copyright (c) 2018, Davide Colombo.

EventSocketOutbound source code is licensed under the [MIT License](LICENSE.md).
