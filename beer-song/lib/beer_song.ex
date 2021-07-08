defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(0), do: "No more bottles of beer on the wall, no more bottles of beer.\n"
    <> "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  @spec verse(integer) :: String.t()
  def verse(1), do: "1 bottle of beer on the wall, 1 bottle of beer.\n"
    <> "Take it down and pass it around, no more bottles of beer on the wall.\n"
  @spec verse(integer) :: String.t()
  def verse(2), do: "2 bottles of beer on the wall, 2 bottles of beer.\n"
    <> "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  @spec verse(integer) :: String.t()
  def verse(number), do: "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"
    <> "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    [h | t] = Enum.to_list(range)
    concat_verse(h, t)
  end
  @spec lyrics() :: String.t()
  def lyrics() do
    [h | t] = Enum.to_list(99..0)
    concat_verse(h, t)
  end
  defp concat_verse(head, tail) do
    case tail do
      [] -> verse(head)
      t -> verse(head) <> "\n" <>
        lyrics(List.first(t)..List.last(t))
    end
  end
end
