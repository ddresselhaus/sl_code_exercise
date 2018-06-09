defmodule SalesLoftCodeExercise.PotentialDuplicates do
  def execute(strings, minimum_score) do
    build_pairs(strings, [], minimum_score)
  end

  defp build_pairs([], pairs, _) do
    Enum.sort_by(pairs, fn %{score: score} -> score end, &>=/2)
  end

  defp build_pairs([head | tail], pairs, minimum_score) do
    new_pairs =
      Enum.reduce(tail, pairs, fn x, acc ->
        score = score_strings(head, x)

        case score >= minimum_score do
          true -> [%{first: head, second: x, score: score} | acc]
          false -> acc
        end
      end)

    build_pairs(tail, new_pairs, minimum_score)
  end

  defp score_strings(a, b) do
    String.jaro_distance(a, b)
  end
end
