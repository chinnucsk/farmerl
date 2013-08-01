%% Copyright
-module(fields).
-author("Konstantin").

%% API
-export([process_field/1, new_field/0]).
-include("domain.hrl").

change_state(Field) ->
  erlang:error(not_implemented).

process_field(Field) when is_record(Field, field) ->
  Now = commons:get_time(),
  NextStatusChange = Field#field.next_status_change,
  if
    NextStatusChange == 0 -> Field;
    Now >= NextStatusChange -> change_state(Field);
    true -> Field
  end;

process_field(_Field) ->
  error(badarg).

new_field() ->
  #field{status = empty_field}.
