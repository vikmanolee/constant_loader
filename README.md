# ConstantLoader

**Load your constants from your DB**

Use DB tables to fetch {id, atom} or similar constructs to an ETS table for quick reference and enum resolve.

## Installation

The package can be installed by adding `constant_loader` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
      {:constant_loader, github: "https://gitlab.stoiximan.eu/v.manoli/constant_loader.git"},
  ]
end
```

## Usage

### Prerequisites

* A database server with needed constant tables
* An application setup with an Ecto Repo and credentials

### Add a constant

1. Add into your config.exs

```elixir
config :constant_loader,
  ets_table_name: :my_app_constants

config :constant_loader, :repo_per_constant_type,
  constant_one: {Repo, My.Constants.ConstantOne},
  constant_two: {Repo, My.Constants.ConstantTwo}
```

2. Add ConstantLoader to your supervision tree

```elixir
defmodule My.Application do
  def start(_type, _args) do
    [
      Repo,
      ConstantLoader
    ]
    |> Supervisor.start_link(strategy: :one_for_one, name: __MODULE__)
  end
end
```

3. Add Ecto.Schemas for the constant tables

```elixir
defmodule ConstantOneSchema do
  use Ecto.Schema

  @primary_key {:id, :id, source: :ID}
  schema "constant_one" do
    field(:name, :string, source: :Name)
    field(:created, :string, source: :Created)
  end
end
```

4. Create a Constant module, implementing a `get/1` and a `load_constants/1`

```elixir
defmodule My.Constants.ConstantOne do
  alias ConstantLoader.Utils

  def get(key), do: ConstantLoader.get(:constant_one, key)

  def load_constants(repo) do
    ConstantOneSchema
    |> repo.all()
    |> Utils.to_map_with_atom_keys()
    |> Utils.reverse_append_map()
  end
end
```

You can use `ConstantLoader.get/2` and `ConstantLoaderUtils` functions to parse your schemas to a key-value map for the ETS table.

5. Grab your constant at any point of your app

```elixir
:one == My.Constants.ConstantOne.get(1)
```

## Linux SQLlite3 testing

Run: 

`sudo apt-get install libsqlite3-dev`

to be able to compile `esqlite` lib
