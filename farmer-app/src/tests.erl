%% Copyright
-module(tests).
-author("Konstantin").

%% API
-export([run_test/0]).

run_test() ->
  code:add_path("farmer-app/ebin"),
  application:start(farmerl).
  %WorkerId = hd(farmerl_supervisor:get_worker_list()),
  %gen_server:call({global, WorkerId}, ping).
