defmodule Bunter do

  @colors [:red, :blue, :green, :orange, :gold, :moccasin, :darkorange, :coral, :darkmagenta]
  @background [
    ["#", "#", "#", "#","#", "#", "#", "#","#", "#", "#", "#","#", "#", "#", "n"],
    ["#", "#", "#", "#","~", "~", "~", "~","~", "~", "~", "~","~", "#", "#", "n"],
    ["#", "^", "^", "#","~", "~", "#", "#","#", "#", "#", "#","#", "#", "#", "n"],
    ["#", "^", "^", "^","^", "^", "#", "#","#", "#", "#", "#","#", "#", "#", "n"]
  ]

  @fps 5

  # @char_to_letter %{0 => "#", 3 => 1 => "2"}

  def hello do
    clear()
    draw_loop(30)
  end

  def frame_end do
    :timer.sleep(div(1000, @fps))
    clear()
  end

  def clear do
    IO.write [IO.ANSI.clear, IO.ANSI.home]
    IO.write [?\r, ?\n]
  end

  def main(args) do
    hello()
  end

  def draw_char("#") do
    [Enum.random(@colors), :bright,'#']
    |> Bunt.ANSI.format
    |> IO.write 
  end
  def draw_char("~") do
    [Enum.random([:darkblue, :deepskyblue]), :bright,'~']
    |> Bunt.ANSI.format
    |> IO.write 
  end
  def draw_char("n") do
    IO.puts ""
  end

  def draw_char("^") do
    [Enum.random([:chocolate, :olive]), '^']
    |> Bunt.ANSI.format
    |> IO.write 
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
    draw_frame(bg)
    frame_end()
    draw_loop(n-1)
  end

end

