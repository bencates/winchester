defmodule WinchesterTest do
  use ExUnit.Case
  doctest Winchester

  test "greets the world" do
    assert Winchester.hello() == :world
  end
end
