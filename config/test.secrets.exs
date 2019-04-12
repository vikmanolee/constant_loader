use Mix.Config

config :constant_loader, Test.Repo,
  database: "AriadneDB",
  username: "sa",
  password: "Ariadne3000",
  hostname: "192.168.99.100",
  port: 1433,
  instance: nil
