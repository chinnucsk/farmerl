%% Copyright
-author("Konstantin").

-export_type([field_status/0, timestamp/0]).

-type field_status()    :: empty_field | growing_field | grown_field | withered_field | reanimated_field | damaged_field.
-type timestamp()       :: non_neg_integer().

-record(field, {
  status :: field_status(),
  next_status_change :: timestamp(),
  content
}).
