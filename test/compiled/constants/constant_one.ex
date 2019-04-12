defmodule Test.Constants.ConstantOne do
  @moduledoc false

  alias ConstantLoader.Utils
  alias Test.Schemas.ConstantOne

  @spec get_name(integer) :: atom
  def get_name(key), do: ConstantLoader.get(:constant_one, key)

  @spec get_id(atom) :: integer
  def get_id(key), do: ConstantLoader.get(:constant_one, key)

  def load_constants(repo) do
    ConstantOne
    |> repo.all()
    |> Utils.to_map_with_atom_keys()
    |> Utils.reverse_append_map()
  end
end
