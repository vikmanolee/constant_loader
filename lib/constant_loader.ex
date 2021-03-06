defmodule ConstantLoader do
  @moduledoc """
  Constant Loader
  """

  @module __MODULE__

  @storage_name Application.get_env(:constant_loader, :ets_table_name)
  @constant_map Enum.into(Application.get_env(:constant_loader, :repo_per_constant_type), %{})

  require Logger

  alias ConstantLoader.Utils

  use GenServer, restart: :transient

  @doc false
  def start_link(_) do
    GenServer.start_link(@module, nil)
  end

  @impl true
  def init(_) do
    :ets.new(@storage_name, [
      :named_table,
      :public,
      {:read_concurrency, true},
      {:write_concurrency, true}
    ])

    load_constants()

    Logger.info("#{@module} constants have been loaded")

    {:ok, nil}
  end

  @impl true
  def handle_cast(:reload, state) do
    do_reload_constants()

    {:no_reply, state}
  end

  @impl true
  def handle_call(:reload, _from, state) do
    do_reload_constants()

    {:reply, :ok, state}
  end

  # Internal #

  defp load_constants do
    Enum.each(@constant_map, fn {constant_key, {constant_repo, constant_module}} ->
      apply(constant_module, :load_constants, [constant_repo])
      |> Enum.each(fn {key, value} ->
        :ets.insert(@storage_name, {{constant_key, key}, value})
      end)
    end)
  end

  defp do_reload_constants do
    :ets.delete_all_objects(@storage_name)

    load_constants()
  end

  # Interface #

  def reload_constants do
    GenServer.call(@module, :reload)
  end

  def reload_constants_async do
    GenServer.cast(@module, :reload)
  end

  def get(ets_key, key, default \\ nil)

  def get(ets_key, [head | tail] = _path, default) do
    @storage_name
    |> :ets.select([{{{ets_key, head}, :"$1"}, [], [:"$1"]}])
    |> hd()
    |> Utils.get_in_data(tail ++ [:""], default)
  end

  def get(ets_key, key, default) do
    ets_entry = :ets.select(@storage_name, [{{{ets_key, key}, :"$1"}, [], [:"$1"]}])

    case ets_entry do
      [] -> default
      [value] -> value
    end
  end
end
