defmodule SalesLoftCodeExercise.CharacterFrequencyAnalyzerTest do
  use SalesLoftCodeExercise.DataCase
  alias SalesLoftCodeExercise.CharacterFrequencyAnalyzer

  test "execute/1 extracts letter frequency data from string" do
    email = "jimmy_mcmahon@salesloft.com"
    result = CharacterFrequencyAnalyzer.execute(email)

    most_common_character = Enum.at(result, 0)

    assert Enum.at(most_common_character, 0) == "m"
    assert Enum.at(most_common_character, 1) == 5
  end

  test "is_letter/1 correctly identifies letters" do
    assert CharacterFrequencyAnalyzer.is_letter?("b")
    assert CharacterFrequencyAnalyzer.is_letter?("B")
    assert CharacterFrequencyAnalyzer.is_letter?("y")
    assert CharacterFrequencyAnalyzer.is_letter?("Y")

    refute CharacterFrequencyAnalyzer.is_letter?("1")
    refute CharacterFrequencyAnalyzer.is_letter?("$")
    refute CharacterFrequencyAnalyzer.is_letter?("?")
    refute CharacterFrequencyAnalyzer.is_letter?("}")
    refute CharacterFrequencyAnalyzer.is_letter?("YY")
  end

  test "execute/1 accepts optional downcase argument" do
    test_string = "Yy"
    assert Enum.count(CharacterFrequencyAnalyzer.execute(test_string)) == 1
    assert Enum.count(CharacterFrequencyAnalyzer.execute(test_string, false)) == 2
  end
end
