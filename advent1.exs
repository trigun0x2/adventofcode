defmodule Advent1 do
  def init() do
    input = IO.gets("Input your directions for Santa! \n")
    str_list = String.split(input, "", trim: true)
    part = IO.gets("Part One or Two? (One, Two): \n")
    case part do
      "One\n" -> paren_parse(str_list, 0, 0)
      "Two\n" -> part2(str_list, 0, 0)
    end
  end

  def paren_parse(str_list, up, down) do
    [hd_str | new_list] = str_list
    case hd_str do
      "(" -> paren_parse(new_list, up + 1, down)
      ")" -> paren_parse(new_list, up, down + 1)
      _   -> print_floor(up, down)
    end
  end

  def print_floor(up, down) do
    IO.puts(up - down)
  end

  def part2(_str_list, -1, index) do
    IO.puts("He has entered the basement on:")
    IO.puts(index)
  end

  def part2(str_list, floor, index) do
    [hd_str | new_list] = str_list
    case hd_str do
      "(" -> part2(new_list, floor + 1, index + 1)
      ")" -> part2(new_list, floor - 1, index + 1)
    end

  end
end
