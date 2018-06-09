defmodule SalesLoftCodeExercise.EmailCharacterFrequencyAnalyzerTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.FetchPeopleMock
  alias SalesLoftCodeExercise.StorePeople
  alias SalesLoftCodeExercise.Store
  alias SalesLoftCodeExercise.EmailCharacterFrequencyAnalyzer

  test "execute/1 extracts letter frequency data from string" do
    Store.start_link()
    json = FetchPeopleMock.execute()
    StorePeople.execute(json)

    records = Store.get_all_person_records()
    result = EmailCharacterFrequencyAnalyzer.execute(records)

    most_common_letter = Enum.at(result, 0)
    assert Enum.at(most_common_letter, 0) == "e"
    assert Enum.at(most_common_letter, 1) == 61
  end
end
