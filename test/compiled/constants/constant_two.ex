defmodule Test.Constants.ConstantTwo do
  @moduledoc false

  alias ConstantLoader.Utils
  alias Test.Schemas.ConstantTwo

  @spec get_name(integer) :: atom
  def get_name(key), do: ConstantLoader.get(:constant_two, key)

  @spec get_id(atom) :: integer
  def get_id(key), do: ConstantLoader.get(:constant_two, key)

  def load_constants(repo) do
    ConstantTwo
    |> repo.all()
    |> Utils.to_map_with_atom_keys()
    |> Utils.reverse_append_map()
  end
end
