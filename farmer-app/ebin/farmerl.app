%% Copyright
{application, farmerl, [
  {description, "FarmErl game application server"},
  {vsn, "1"},
  {registered, [farmerl]},
  {modules, [commons, farmerl_worker, fields, farmerl_supervisor,
    farmerl_worker_manager_supervisor]},
  {applications, [
    kernel,
    stdlib
  ]},
  {mod, {farmerl, []}},
  {env, []}
]}.