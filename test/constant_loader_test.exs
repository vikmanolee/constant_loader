defmodule ConstantLoaderTest do
  use ExUnit.Case

  alias Test.Constants.{ConstantOne, ConstantTwo}

  test "Initiates ConstantsLoader" do
    :ets.select(:my_app_constants, [{{{:constant_one, 1}, :"$1"}, [], [:"$1"]}])
    |> IO.inspect()
    # assert ConstantOne.get_name(1) == :one
  end
end
