defmodule ConstantLoader.Constant do
  @moduledoc """
  Base Constant module

  `use` this module to create simpler custom constant modules

  A simple `get/1` is implemented by default,
  but implementing your own `get_*` to distinguish between several key types is advised
  """
  @callback constant_map([Ecto.Schema.t()]) :: map

  defmacro __using__(key: constant_key, schema: constant_schema) do
    quote do
      @behaviour ConstantLoader.Constant
      
      def get(key) do
        ConstantLoader.get(unquote(constant_key), key)
      end

      def load_constants(repo) do
        unquote(constant_schema)
        |> repo.all()
        |> constant_map()
      end
    end
  end
end
