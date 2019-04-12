defmodule ConstantLoader.Utils do
  @moduledoc false

  def get_in_data(data, path, default \\ nil)
  def get_in_data(%{} = data, [path], default), do: Map.get(data, path, default)

  def get_in_data(%{} = data, [path | rest_paths], default),
    do: data |> Map.get(path) |> get_in_data(rest_paths, default)

  def get_in_data(_, _, default), do: default
end
