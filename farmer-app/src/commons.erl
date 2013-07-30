%% Copyright
-module(commons).
-author("Konstantin").

%% API
-export([get_time/0]).
-include("inc/domain.hrl").

-spec get_time() ->
  non_neg_integer().

get_time() ->
  {MegaSeconds, Seconds, _} = now(),
  MegaSeconds * 1000000 + Seconds.
