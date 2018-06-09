defmodule SalesLoftCodeExercise.EmailPotentialDuplicates do
  alias SalesLoftCodeExercise.Store
  alias SalesLoftCodeExercise.PotentialDuplicates

  @minimum_score 0.7

  def execute(records) do
    emails = Enum.map(records, fn {_, _, record} -> record.email_address end)

    PotentialDuplicates.execute(emails, @minimum_score)
  end
end
