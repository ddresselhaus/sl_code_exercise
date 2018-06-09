defmodule SalesLoftCodeExercise.PollerTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.Poller
  alias SalesLoftCodeExercise.Store

  test "init/1 hyrdates store" do
    Store.start_link()
    store = Store.get_all_person_records()
    assert Enum.count(store) == 0
    Poller.start_link()
    :timer.sleep(10)
    store = Store.get_all_person_records()
    assert Enum.count(store) == 25
  end
end
