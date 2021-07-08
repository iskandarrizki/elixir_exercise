defmodule RomanNumerals do

  @roman_numerals [
    { 1000, "M"  },
    { 900 , "CM" },
    { 500 , "D"  },
    { 400 , "CD" },
    { 100 , "C"  },
    { 90  , "XC" },
    { 50  , "L"  },
    { 40  , "XL" },
    { 10  , "X"  },
    { 9   , "IX" },
    { 5   , "V"  },
    { 4   , "IV" },
    { 1   , "I"  },
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t
  def numeral(number) do
    numeral number, ""
  end

  @spec numeral(pos_integer, String.t) :: String.t
  defp numeral(0, string), do: string
  defp numeral(number, string) do
    {roman_number, roman_letter} =
      Enum.find(@roman_numerals, fn ({roman_n, _}) -> number >= roman_n end)
    numeral number - roman_number, "#{string}#{roman_letter}"
  end

end
