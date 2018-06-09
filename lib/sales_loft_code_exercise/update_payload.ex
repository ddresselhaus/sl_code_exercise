defmodule SalesLoftCodeExercise.UpdatePayload do
  alias SalesLoftCodeExercise.EmailPotentialDuplicates
  alias SalesLoftCodeExercise.EmailCharacterFrequencyAnalyzer

  def execute(records) do
    map(records) |> Poison.encode!()
  end

  def map(records) do
    %{
      persons: Enum.map(records, fn {_, _, x} -> x end),
      potential_duplicates: EmailPotentialDuplicates.execute(records),
      frequency_analysis: EmailCharacterFrequencyAnalyzer.execute(records)
    }
  end
end
