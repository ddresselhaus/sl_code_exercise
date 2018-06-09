defmodule SalesLoftCodeExercise.FetchPeopleMock do
  def execute() do
    json = "./test/support/test_response.json" |> File.read!()
    {:ok, json}
  end
end
