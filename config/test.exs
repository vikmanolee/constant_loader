use Mix.Config

config :constant_loader,
  ecto_repos: [
    Ariadne.SBState.DB.Repo,
    Ariadne.SBState.DB.MetadataRepo
  ]

# set the repo from which, each type of constant is to be loaded
config :constant_loader, :repo_per_constant_type,
  specifiers: Ariadne.SBState.DB.Repo,
  specifier_data_types: Ariadne.SBState.DB.Repo,
  market_lines: Ariadne.SBState.DB.MetadataRepo,
  market_line_types: Ariadne.SBState.DB.MetadataRepo,
  selection_result_types: Ariadne.SBState.DB.MetadataRepo
