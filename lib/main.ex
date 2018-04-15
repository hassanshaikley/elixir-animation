defmodule Main do

  @colors [:red, :blue, :green, :orange, :gold, :moccasin, :darkorange, :coral, :darkmagenta]
  @background [
    ["Y", "Y", "▧", ".",".", ".", ".", ".",".", ".", ".", ".",".", ".", "Y", "n"],
    ["Y", ".", ".", ".","~", "~", "~", "~","~", "~", "~", "~","~", ".", ".", "n"],
    [".", "^", "^", ".","~", "~", ".", ".",".", ".", "Y", "Y",".", "Y", ".", "n"],
    [".", "^", "^", "^","^", "^", ".", ".",".", ".", "Y", "Y",".", ".", "█", "n"]
  ]

  @fps 5

  # @char_to_letter %{0 => ".", 3 => 1 => "2"}


  def frame_end do
    :timer.sleep(div(1000, @fps))
    clear()
  end

  def clear do
    Bunt.write [IO.ANSI.clear, IO.ANSI.home]
    Bunt.write [?\r, ?\n]
  end

  def main(args) do
    draw_loop(50)
  end

  def draw_char(".") do
    [Enum.random([:color94]), :bright,'.']
    |> Bunt.write 
  end
  def draw_char("~") do
    [Enum.random([:darkblue, :deepskyblue]), :bright,'~']
    |> Bunt.write 
  end
  def draw_char("n") do
    IO.puts ""
  end
  def draw_char("█") do
    [Enum.random([:darkblue, :mediumblue]),'█']
    |> Bunt.write 
  end
  def draw_char("▧") do
    [:bright, Enum.random([:red]),'▧']
    |> Bunt.write 
  end

  def draw_char("Y") do
    [Enum.random([ :darkgreen]), 'Y']
    |> Bunt.write 
  end
  

  def draw_char("^") do
    [Enum.random([:chocolate, :olive]), '^']
    |> Bunt.write 
  end
 
  def draw_frame([head]) do
    draw_char(head)
  end

  def draw_frame([head | tail]) do
    draw_char(head)
    draw_frame(tail)
  end

  def draw_loop(n) when n <= 1 do
    frame_end()
  end
  def draw_loop(n) do
    bg = List.flatten(@background)
    frame_end()
    draw_frame(bg)
    draw_loop(n-1)
  end

end

