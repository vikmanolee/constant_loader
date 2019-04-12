defmodule Test.Application do
  @moduledoc false

  @name __MODULE__

  @doc false
  def start(_type, _args) do
    [
      Test.Repo,
      ConstantLoader
    ]
    |> Supervisor.start_link(strategy: :one_for_one, name: @name)
  end
end
