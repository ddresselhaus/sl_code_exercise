defmodule SalesLoftCodeExercise.JsonResponseTest do
  use SalesLoftCodeExercise.DataCase

  test "fake data works", %{json: json} do
    data =
      json
      |> Poison.decode!()
      |> Map.get("data")

    is_letter? = fn string -> Regex.match?(~r/([a-zA-Z])/, string) end

    letter_list =
      data
      |> Enum.map(fn x -> Map.get(x, "email_address", nil) end)
      |> Enum.reject(&is_nil/1)
      |> Enum.join()
      |> String.split("")

    result =
      letter_list
      |> Enum.group_by(& &1, & &1)
      |> Enum.reduce(%{}, fn {key, value}, map ->
        case is_letter?.(key) do
          true -> Map.put(map, key, Enum.count(value))
          false -> map
        end
      end)
      |> Enum.map(fn {key, value} -> [key, value] end)
      |> Enum.sort_by(fn x -> Enum.at(x, 1) end)
      |> Enum.reverse()

    new_json = Poison.encode!(result)

    require IEx
    IEx.pry()
  end
end
