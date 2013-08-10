%% Copyright
-module(farmerl_config).
-author("Konstantin").

-include("log.hrl").

%% API
-export([read/1, get/2]).

-spec read_configs(Files) -> ok | {error, _} when
  Files :: list().

-spec read_config(FileName) -> ok | {error, _} when
  FileName :: string().

get(Table, Key) when is_atom(Table) ->
  [{Key,Value}|_] = ets:lookup(Table, Key),
  Value.

init_tables() ->
  ets:new(crops, [set, named_table]),
  ets:new(farmerl_app, [set, named_table]).

register_term(Table, Key, Value) when is_atom(Table) ->
  ets:insert(Table, {Key, Value}).

register_terms([]) ->
  ok;

register_terms([{Table, Key, Value}|T]) when is_atom(Table) ->
  case register_term(Table, Key, Value) of
    true ->
      register_terms(T);
    _ ->
      {error, setting_not_persisted}
  end.

read(L) when is_list(L) ->
  init_tables(),
  read_configs(L).

read_configs([]) ->
  ok;

read_configs([H|T]) ->
  case read_config(H) of
    ok ->
      read_configs(T);
    {error, Reason} ->
      {error, Reason}
  end.

read_config(FileName) ->
  ?INFO("Reading " ++ FileName),
  case file:consult(FileName) of
    {ok, Terms} ->
      register_terms(Terms),
      ok;
    {error, {Line, Mod, Term}} ->
      ?ERROR(log:format_message("Failed to read ", FileName, ": Bad Syntax on ", {Line, Mod, Term})),
      {error, badsyntax};
    {error, Reason} ->
      ?ERROR(log:format_message("Failed to read ", FileName, Reason)),
      {error, Reason}
  end.
