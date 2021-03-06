%% Copyright
-module(farmerl_worker).
-author("Konstantin").

-behaviour(gen_server).

%% API
-export([start_link/1]).

%% gen_server
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
  code_change/3]).

%% API
start_link(WorkerId) ->
  gen_server:start_link({global, WorkerId}, ?MODULE, [], []).

%% gen_server callbacks

init(_) ->
  {ok, null}.

handle_call(ping, _From, State) ->
  {reply, pong, State};

handle_call(_Request, _From, State) ->
  {noreply, State}.

handle_cast(_Request, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.
