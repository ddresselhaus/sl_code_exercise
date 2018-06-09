defmodule SalesLoftCodeExercise.CharacterFrequencyAnalyzer do
  def execute(string, downcase \\ true) do
    string
    |> conditional_downcase(downcase)
    |> String.split("")
    |> Enum.group_by(& &1, & &1)
    |> Enum.reduce(%{}, fn {key, value}, acc ->
      case is_letter?(key) do
        true -> Map.put(acc, key, Enum.count(value))
        false -> acc
      end
    end)
    |> Enum.map(fn {key, value} -> [key, value] end)
    |> Enum.sort_by(fn x -> Enum.at(x, 1) end, &>=/2)
  end

  def is_letter?(character) do
    Regex.match?(~r/\A[a-zA-Z]\z/, character)
  end

  def conditional_downcase(string, downcase) do
    case downcase do
      true -> String.downcase(string)
      false -> string
    end
  end
end
