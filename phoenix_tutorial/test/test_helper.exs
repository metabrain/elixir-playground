ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PhoenixTutorial.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PhoenixTutorial.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PhoenixTutorial.Repo)

