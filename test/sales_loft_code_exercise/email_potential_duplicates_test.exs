defmodule SalesLoftCodeExercise.EmailPotentialDuplicatesTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.EmailPotentialDuplicates
  alias SalesLoftCodeExercise.FetchPeopleMock
  alias SalesLoftCodeExercise.StorePeople
  alias SalesLoftCodeExercise.Store

  test "execute/1 extracts letter frequency data from string" do
    Store.start_link()
    json = FetchPeopleMock.execute()
    StorePeople.execute(json)

    records = Store.get_all_person_records()
    result = EmailPotentialDuplicates.execute(records)

    highest_score = Enum.at(result, 0)

    assert highest_score.first == "alna@hirthe.biz"
    assert highest_score.second == "kanira@heaney.biz"
    assert highest_score.score > 0.7
  end
end
