use Mix.Config

config :constant_loader, Test.Repo,
  adapter: Sqlite.Ecto2,
  database: "test/sql/constants_db.sqlite3"
