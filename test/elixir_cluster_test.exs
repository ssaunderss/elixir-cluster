defmodule ElixirClusterTest do
  use ExUnit.Case
  doctest ElixirCluster

  test "greets the world" do
    assert ElixirCluster.hello() == :world
  end
end
