%% Copyright
-module(fields).
-author("Konstantin").

%% API
-export([process_field/1, new_field/0]).
-include("inc/domain.hrl").

change_state(Field) ->
  erlang:error(not_implemented).

process_field(Field) when is_record(Field, field) ->
  Now = commons:get_time(),
  if
    Now >= Field#field.next_status_change -> change_state(Field);
    true -> Field
  end;

process_field(_Field) ->
  error(badarg).

new_field() ->
  #field{status = ?EMPTY_FIELD}.
