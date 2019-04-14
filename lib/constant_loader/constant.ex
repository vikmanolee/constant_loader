defmodule ConstantLoader.Constant do
  @moduledoc """
  Base Constant module

  `use` this module to create simpler custom constant modules
  """
  @callback load_constants(ecto_repo :: Ecto.Repo.t()) :: map

  defmacro __using__(key: constant_key, schema: constant_schema) do
    quote do
      @behaviour ConstantLoader.Constant
      
      def get(key) do
        ConstantLoader.get(unquote(constant_key), key)
      end

      def db_results(repo) do
        unquote(constant_schema)
        |> repo.all()
      end
    end
  end
end
