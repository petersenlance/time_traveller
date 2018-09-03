defmodule TimeTravellerTest do
  use ExUnit.Case
  doctest TimeTraveller

  test "greets the world" do
    assert TimeTraveller.hello() == :world
  end
end
