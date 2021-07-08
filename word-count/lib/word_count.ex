defmodule WordCount do

  require Logger
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.replace("_", " ")
    |> String.downcase()
    #|> String.split(" ")
    |> split_words()
    #|> Enum.map(fn w ->
    #  if w =~ "-", do: w, else: String.replace(w, ~r/[\p{P}\p{S}]/, "")
    #end)
    #|> Enum.filter(fn w -> w != "" end)
    |> Enum.reduce(%{}, fn ([w], acc) ->
      Map.update(acc, w, 1, &(&1 + 1))
    end)
    #|> Enum.map(fn {w, count} ->
    #  {Enum.join(for <<c::utf8 <- w>>, do: <<c::utf8>>), count}
    #end) |> Enum.into(%{})
    #|> log()
  end

  @spec split_words(String.t) :: [String.t]
  defp split_words(text) do
    Regex.scan ~r/(*UTF)[\p{L}0-9-]+/i, text
  end

  defp log(result) do
    Logger.log(:debug, "#{inspect result}")
    result
  end
end
