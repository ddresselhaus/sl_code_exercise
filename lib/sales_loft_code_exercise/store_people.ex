defmodule SalesLoftCodeExercise.StorePeople do
  alias SalesLoftCodeExercise.Store

  def execute({:ok, json}) do
    response = Poison.decode!(json)
    data = Map.fetch!(response, "data")
    store_people(data)
  end

  defp store_people(data) do
    store_responses = Enum.map(data, &store_person/1)

    no_changes =
      Enum.all?(store_responses, fn x ->
        x == {:ok, :no_op}
      end)

    case no_changes do
      true -> {:ok, :no_op}
      false -> {:ok, :update}
    end
  end

  def store_person(person) do
    id = person["id"]
    Store.add_person_record({:person, id}, person)
  end
end
