defmodule ConstantLoader.Utils do
  @moduledoc false

  def get_in_data(data, path, default \\ nil)
  def get_in_data(%{} = data, [path], default), do: Map.get(data, path, default)

  def get_in_data(%{} = data, [path | rest_paths], default),
    do: data |> Map.get(path) |> get_in_data(rest_paths, default)

  def get_in_data(_, _, default), do: default

  def put_in_data(data, path, value, opts \\ [])

  def put_in_data(%{} = data, [], _value, _opts), do: data

  def put_in_data(%{} = data, [path], value, _opts), do: Map.put(data, path, value)

  def put_in_data(%{} = data, [[path: path, default: default] | rest_paths], value, opts) do
    current = Map.get(data, path, default)
    override = Keyword.get(opts, :override, false)
    current = if override and is_nil(current), do: default, else: current
    Map.put(data, path, put_in_data(current, rest_paths, value, opts))
  end

  def put_in_data(%{} = data, [path | rest_paths], value, opts) do
    current = Map.get(data, path, %{})
    override = Keyword.get(opts, :override, false)
    current = if override and !is_map(current), do: %{}, else: current
    Map.put(data, path, put_in_data(current, rest_paths, value, opts))
  end

  def put_in_data(data, _, _, _), do: data

  @doc """
    Turns a list of keys with a format of ["A.B", "A.B.C"] into
    a tuple of the form
      {
        %{
          "A.B" => [:a, :b],
          "A.B.C" => [:a, :b, :c]
        },
        %{
          a: %{
            b: %{
              c: nil
            }
          }
        }
      }
  """
  @spec keys_to_map([String.t()]) :: map
  def keys_to_map(keys)

  def keys_to_map(keys) do
    keys = Enum.sort_by(keys, &String.downcase/1)

    Enum.reduce(keys, {%{}, %{}}, fn key, {map, key_map} ->
      map_path = key_to_map_path(key)
      map = put_in_data(map, map_path, nil, override: true)
      key_map = Map.put(key_map, key, map_path)
      {map, key_map}
    end)
  end

  @doc """
    Turns a key with a format of "A.B" into
    a list of the form [:a, :b] to be used as
    a path to a value inside a map
  """
  @spec key_to_map_path(String.t()) :: [atom]
  def key_to_map_path(key)

  def key_to_map_path(key) when is_binary(key) do
    key
    |> String.trim()
    |> String.split(".", trim: true)
    |> Enum.map(&Macro.underscore/1)
    |> Enum.map(&String.to_atom/1)
    |> Enum.concat([:""])
  end

  def to_map_with_atom_key_paths(db_result) do
    key_id_map =
      db_result
      |> Enum.map(fn %{id: id, key: key} -> {key, id} end)
      |> Map.new()

    {map, key_map} =
      key_id_map
      |> Enum.map(fn {key, _} -> key end)
      |> keys_to_map()

    Enum.reduce(key_map, map, fn {key, map_path}, map ->
      put_in_data(map, map_path, key_id_map[key])
    end)
  end

  def to_map_with_atom_keys(repo_results) do
    repo_results
    |> Enum.map(fn %{:id => id, :name => name} ->
      key_name =
        name
        |> String.trim()
        |> String.downcase()
        |> String.replace(" ", "_")
        |> String.to_atom()

      {key_name, id}
    end)
    |> Map.new()
  end

  #
  # Makes a map out of a tuples list, where values of keys are accumulated as a list.
  #
  # i.e.: [{1,2},{1,3},{1,4},{2,8}] -> %{1 => [2,3,4], 2 => [8]}
  #
  def zip_to_map_listing_duplicates(tuples_list) do
    Enum.reduce(tuples_list, %{}, fn {key_id, value_id}, acc ->
      {_, result} =
        Map.get_and_update(acc, key_id, fn
          nil -> {nil, [value_id]}
          current_value -> {current_value, [value_id | current_value]}
        end)

      result
    end)
  end

  def reverse_append_map(map) do
    reversed = Enum.map(map, fn {key, value} -> {value, key} end)

    map
    |> Map.to_list()
    |> Enum.concat(reversed)
    |> Map.new()
  end
end
