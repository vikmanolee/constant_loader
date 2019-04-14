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

See tests