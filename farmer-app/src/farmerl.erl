%% Copyright
-module(farmerl).
-author("Konstantin").

-behaviour(application).

% application
-export([start/2, stop/1]).

% application callbacks
start(_Type, _Args) ->
  farmerl_config:read(["config/system.cfg"]),
  WorkerCount = farmerl_config:get(farmerl_app, worker_count),
  ShutDownDelay = farmerl_config:get(farmerl_app, shutdown_delay),
  AllowedRestarts = farmerl_config:get(farmerl_app, allowed_restarts),
  MaxSeconds = farmerl_config:get(farmerl_app, max_seconds),
  farmerl_supervisor:start_link(WorkerCount, ShutDownDelay, AllowedRestarts, MaxSeconds).

stop(_State) ->
  ok.
