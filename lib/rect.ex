defmodule Rectangle do
  def area_loop do
    receive do # says this process will receive a message at some point or another
      {:area, w, h} ->
      IO.puts("Area = #{w*h}")
      area_loop() # Run process recursively so it keeps going holy dhsit
      {:pmeter, w, h} ->
      IO.puts("Area = #{w*h}")
      area_loop()
    end
  end
end