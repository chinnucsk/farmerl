%% Copyright
-module(log).
-author("Konstantin").

%% API
-export([log/4, format_message/3]).

log(Data, Level, Module, Line) ->
  {{LogY, LogM, LogD}, {LogH, LogMin, LogS}} = calendar:local_time(),
  io:format("~2.10.0B/~2.10.0B/~4.10.0B ~2.10.0B:~2.10.0B:~2.10.0B [~w:~w] ~s ~ts~n",
    [LogD, LogM, LogY, LogH, LogMin, LogS, Module, Line, Level, Data]).

format_message(S, A, F) when is_atom(A) and is_list(S) and is_list(F) ->
  S ++ atom_to_list(A) ++ F.