defmodule Advent2  do
  def init(file_name) do
    File.read!(file_name)
    |> String.split("\n", trim: true)
    |> Enum.map(&calc_area/1)
    |> Enum.sum()
  end

  def calc_area(dimen_str) do
    [l, w, h] = dimen_str
      |> String.split("x")
      |> Enum.map(&String.to_integer/1)
    side_areas = [l*w, w*h, h*l]
    ribbon = side_areas
      |> Enum.min()
    box_area = side_areas
      |> Enum.map(fn x -> x*2 end)
      |> Enum.sum()

    ribbon + box_area
  end
end
