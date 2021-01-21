defmodule Lists do

  def tak(l) do
    case l do
      [] -> :no
      [head|_] -> head
    end
  end

  def drp(l) do
    case l do
      [] -> :no
      [_|tail] -> tail
    end
  end

  def len(l) do
    length(l)
  end

  def sum(l) do
    case l do
      [] -> 0
      [head|tail] -> head + sum(tail)
    end
  end

  def duplicate(l) do
    case l do
      [] -> []
      [head|tail] -> [head, head] ++ duplicate(tail)
    end
  end

  def add(x,l) do

    [head|tail] = l
    if head != x or head != [] do
      add(x,tail)
    end

    l ++ [x]

  end

end
