use Mix.Config

config :constant_loader, Repo,
  database: "AriadneDB",
  username: "sa",
  password: "sa",
  hostname: "localhost",
  port: 1433,
  instance: nil
