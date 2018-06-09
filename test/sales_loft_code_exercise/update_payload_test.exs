defmodule SalesLoftCodeExercise.UpdatePayloadTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.UpdatePayload
  alias SalesLoftCodeExercise.FetchPeopleMock
  alias SalesLoftCodeExercise.StorePeople
  alias SalesLoftCodeExercise.Store

  test "map/1 returns an updated data map" do
    Store.start_link()
    json = FetchPeopleMock.execute()
    StorePeople.execute(json)

    records = Store.get_all_person_records()
    result = UpdatePayload.map(records)
    assert Enum.count(result.potential_duplicates) == 2
  end

  test "execute/1 returns a json encoded string" do
    Store.start_link()
    json = FetchPeopleMock.execute()
    StorePeople.execute(json)

    records = Store.get_all_person_records()
    json = UpdatePayload.execute(records)
    result = Poison.decode!(json, keys: :atoms)

    assert Enum.count(result.potential_duplicates) == 2
  end
end
