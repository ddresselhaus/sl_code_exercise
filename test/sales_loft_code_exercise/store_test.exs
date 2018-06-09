defmodule SalesLoftCodeExercise.StoreTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.Store

  test "ETS table manager works" do
    Store.start_link()
    record = %{initial: :record}
    id = 10

    {:ok, :create} = Store.add_person_record({:person, id}, record)
    {:ok, :no_op} = Store.add_person_record({:person, id}, record)
    updated_record = %{different: record}
    {:ok, :update} = Store.add_person_record({:person, id}, updated_record)

    [{_, _, returned_record}] = Store.get_all_person_records()
    assert updated_record == returned_record
  end
end
