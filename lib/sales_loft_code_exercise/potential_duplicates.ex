defmodule SalesLoftCodeExercise.PotentialDuplicates do
  def execute(strings) do
    pairs = build_pairs(strings, [])
    score_pairs(pairs)
  end

  defp build_pairs([], pairs), do: pairs

  defp build_pairs([head | tail], pairs) do
    new_pairs =
      Enum.reduce(tail, pairs, fn x, acc ->
        [{head, x} | acc]
      end)

    build_pairs(tail, new_pairs)
  end

  defp score_pairs(pairs) do
    Enum.map(pairs, fn {a, b} ->
      %{first: a, second: b, score: score_strings(a, b)}
    end)
    |> Enum.sort_by(fn %{score: score} -> score end, &>=/2)
  end

  defp score_strings(a, b) do
    String.jaro_distance(a, b)
  end
end
