defmodule Bob do
  def hey(input) do
    trimmed = String.trim(input)
    cond do
      is_empty?(trimmed) -> "Fine. Be that way!"
      is_shouting_question?(trimmed) -> "Calm down, I know what I'm doing!"
      is_shouting?(trimmed) -> "Whoa, chill out!"
      is_question?(trimmed) -> "Sure."
      true -> "Whatever."
    end
  end

  defp is_empty?(""), do: true
  defp is_empty?(_str), do: false
  defp is_shouting?(str), do: String.upcase(str) == str and String.match?(str, ~r/\p{L}/)
  defp is_question?(str), do: String.ends_with?(str, "?")
  defp is_shouting_question?(str), do: is_shouting?(str) and is_question?(str)
end
