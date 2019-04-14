defmodule ConstantLoaderTest do
  use ExUnit.Case

  alias Test.Constants.{ConstantOne, ConstantTwo}

  test "ETS table is loaded" do
  	assert :my_app_constants in :ets.all()
  end

  test "gets constant values" do
    assert ConstantOne.get_name(1) == :one
    assert ConstantTwo.get_id(:fourty) == 4
  end
end
