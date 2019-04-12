defmodule ConstantLoaderTest do
  use ExUnit.Case
  doctest ConstantLoader

  test "greets the world" do
    assert ConstantLoader.hello() == :world
  end
end
