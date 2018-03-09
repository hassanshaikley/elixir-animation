defmodule Bunter do

  @colors [:red, :blue, :green, :orange, :gold, :moccasin, :darkorange, :coral, :darkmagenta]
  @background [
    ['#', '#', '#', '#','#', '#', '#', '#','#', '#', '#', '#','#', '#', '#', '#'],
    ['#', '#', '#', '#','#', '#', '#', '#','#', '#', '#', '#','#', '#', '#', '#'],
    ['#', '#', '#', '#','#', '#', '#', '#','#', '#', '#', '#','#', '#', '#', '#'],
    ['#', '#', '#', '#','#', '#', '#', '#','#', '#', '#', '#','#', '#', '#', '#']
  ]
  def hello do
    clear()
    recurse_ok('Hello', 20)
  end

  def frame_end do
    :timer.sleep(200)
    clear()
  end


  def clear do
    IO.write [IO.ANSI.clear, IO.ANSI.home]
    IO.write [?\r, ?\n]
  end

  

  def main(args) do
    hello()
  end

  def background_to_string do
    Enum.join(@background, "\n")
  end

  def canvas(index) do
    bg = @background
    newrow = Enum.at(bg, 3)

    newrow = List.replace_at(newrow, rem(-index, newrow |> length), '@')
    IO.puts "####A##STORY####"

    bg = List.replace_at(bg, 2, newrow)
    Enum.join(bg, "\n")
  end


  def recurse_ok(msg, n) when n <= 1 do
    [:lightgray, n |> canvas]
    |> Bunt.ANSI.format
    |> IO.puts 
  end
  def recurse_ok(msg, n) do

    [Enum.random(@colors), :bright, n |>canvas]
    |> Bunt.ANSI.format
    |> IO.puts 
    frame_end()
    
    recurse_ok(msg, n - 1)
  end
end