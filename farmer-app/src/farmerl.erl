%% Copyright
-module(farmerl).
-author("Konstantin").

-behaviour(application).

% application
-export([start/2, stop/1]).

% application callbacks
start(_Type, _Args) ->
  farmerl_supervisor:start_link(100, 10000, 10, 5).

stop(_State) ->
  ok.
