%% Copyright
-author("Konstantin").

-export_type([field_status/0, timestamp/0]).

-define(EMPTY_FIELD, 0).
-define(GROWING_FIELD, 1).
-define(GROWN_FIELD, 2).
-define(WITHERED_FIELD, 3).
-define(REANIMATED_FIELD, 4).
-define(DAMAGED_FIELD, 5).

-type field_status()    :: ?EMPTY_FIELD..?DAMAGED_FIELD.
-type timestamp()       :: non_neg_integer().

-record(field, {
  status :: field_status(),
  next_status_change :: timestamp(),
  content
}).
