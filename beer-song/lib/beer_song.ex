defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    case number do
      0 -> "No more bottles of beer on the wall, no more bottles of beer.\n"
      <> "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      1 -> "1 bottle of beer on the wall, 1 bottle of beer.\n"
      <> "Take it down and pass it around, no more bottles of beer on the wall.\n"
      2 -> "2 bottles of beer on the wall, 2 bottles of beer.\n"
      <> "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      other -> "#{other} bottles of beer on the wall, #{other} bottles of beer.\n"
      <> "Take one down and pass it around, #{other - 1} bottles of beer on the wall.\n"
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ nil) do
    range = if range == nil, do: 99..0, else: range
    [h | t] = Enum.to_list(range)

    case t do
      [] -> verse(h)
      tail -> verse(h) <> "\n" <>
        lyrics(List.first(tail)..List.last(tail))
    end
  end
end
