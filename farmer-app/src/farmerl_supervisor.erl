%% Copyright
-module(farmerl_supervisor).
-author("Konstantin").

-behaviour(supervisor).

%% API
-export([start_link/4, get_worker_list/0]).

%% supervisor
-export([init/1]).

-include("log.hrl").

%% API
start_link(WorkerCount, ShutDownDelay, AllowedRestarts, MaxSeconds) ->
  supervisor:start_link({global, ?MODULE}, ?MODULE, [WorkerCount, ShutDownDelay, AllowedRestarts, MaxSeconds]).

get_worker_list() ->
  worker_spec2id_list(supervisor:which_children({global, ?MODULE})).

worker_spec2id_list(L) ->
  worker_spec2id_list(L, []).

worker_spec2id_list([H|T], R) ->
  worker_spec2id_list(T, [worker_spec2id(H)|R]);

worker_spec2id_list([], R) ->
  R.

worker_spec2id({W, _, _, _}) ->
  W.

%% supervisor callbacks
init([WorkerCount, ShutDownDelay, AllowedRestarts, MaxSeconds]) ->
  WorkerNames = [list_to_atom("Worker" ++ integer_to_list(I)) || I <- lists:seq(1, WorkerCount)],
  Workers = [{X, {farmerl_worker, start_link, [X]}, permanent, ShutDownDelay,
    worker, [farmerl_worker]} || X <- WorkerNames],
  {ok, {{one_for_one, AllowedRestarts, MaxSeconds}, Workers}}.
