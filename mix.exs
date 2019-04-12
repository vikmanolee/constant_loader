defmodule ConstantLoader.MixProject do
  use Mix.Project

  def project do
    [
      app: :constant_loader,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/compiled"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "2.2.11",  only: [:test], override: true},
      {:tds_ecto, "2.2.1", only: [:test]}
    ]
  end
end
