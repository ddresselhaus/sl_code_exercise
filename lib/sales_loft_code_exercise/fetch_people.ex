defmodule SalesLoftCodeExercise.FetchPeople do
  @url "https://api.salesloft.com/v2/people.json"
  def execute() do
    env = Application.get_env(:sales_loft_code_exercise, __MODULE__)

    headers = [
      Authorization: "Bearer #{env[:api_key]}",
      Accept: "Application/json; Charset=utf-8"
    ]

    case HTTPoison.get(@url, headers) do
      {:ok, response} ->
        {:ok, response.body}

      error ->
        error
    end
  end
end
