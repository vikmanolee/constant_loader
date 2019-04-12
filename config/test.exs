use Mix.Config

config :constant_loader, ets_table_name: :my_app_constants

config :constant_loader,
  ecto_repos: [Test.Repo]

# set the repo from which, each type of constant is to be loaded
config :constant_loader, :repo_per_constant_type,
  constant_one: {Test.Repo, Test.Constants.ConstantOne},
  constant_two: {Test.Repo, Test.Constants.ConstantTwo}
