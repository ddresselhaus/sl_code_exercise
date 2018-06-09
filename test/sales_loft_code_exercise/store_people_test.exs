defmodule SalesLoftCodeExercise.StorePeopleTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.FetchPeopleMock
  alias SalesLoftCodeExercise.StorePeople
  alias SalesLoftCodeExercise.Store

  test "execute/1 works" do
    Store.start_link()
    json = FetchPeopleMock.execute()
    a = StorePeople.execute(json)
    b = StorePeople.execute(json)
    assert a == {:ok, :update}
    assert b == {:ok, :no_op}

    response = Store.get_all_person_records()
    assert Enum.count(response)
  end
end
