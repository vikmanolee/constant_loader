defmodule Test.Constants.ConstantTwo do
  @moduledoc false

  alias ConstantLoader.Utils, as: U

  use ConstantLoader.Constant, key: :constant_two,
    schema: Test.Schemas.ConstantTwo

  @spec get_name(integer) :: atom
  def get_name(key), do: get(key)

  @spec get_id(atom) :: integer
  def get_id(key), do: get(key)

  def constant_map(db_results) do
    db_results
    |> U.to_map_with_atom_keys()
    |> U.reverse_append_map()
  end
end
