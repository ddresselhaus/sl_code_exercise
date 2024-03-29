defmodule SalesLoftCodeExercise.FetchPeopleMockTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.FetchPeopleMock

  test "execute/1 works" do
    {:ok, json} = FetchPeopleMock.execute()
    assert is_map(Poison.decode!(json))
  end
end
