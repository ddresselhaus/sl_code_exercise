defmodule SalesLoftCodeExercise.PotentialDuplicatesTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.PotentialDuplicates

  test "execute/1 scores and sorts pairs of strings" do
    emails = [
      "benoliv@salesloft.com",
      "benolive@salesloft.com",
      "george_aiegwnd@boyer.name",
      "alna@hirthe.biz",
      "kanira@heaney.biz"
    ]

    scored_pairs = PotentialDuplicates.execute(emails)
    closest_pair = Enum.at(scored_pairs, 0)

    assert closest_pair.first == "benoliv@salesloft.com"
    assert closest_pair.second == "benolive@salesloft.com"
    assert closest_pair.score > 0.95
  end
end
