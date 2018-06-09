defmodule SalesLoftCodeExercise.EmailCharacterFrequencyAnalyzer do
  alias SalesLoftCodeExercise.Store
  alias SalesLoftCodeExercise.CharacterFrequencyAnalyzer

  def execute(records) do
    email_string =
      Enum.map(records, fn {_, _, record} -> record.email_address end)
      |> Enum.join()

    CharacterFrequencyAnalyzer.execute(email_string)
  end
end
