%% Copyright
-author("Konstantin").

-define(LOG(Data, Level), log:log(Data, Level, ?MODULE, ?LINE)).

-define(DEBUG(Data), ?LOG(Data, "DEBUG")).
-define(INFO(Data), ?LOG(Data, "INFO")).
-define(ERROR(Data), ?LOG(Data, "ERROR")).
-define(WARNING(Data), ?LOG(Data, "WARNING")).
