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
    if head != x or tail != [] do
      add(x,tail)
    else
      if head == x and tail == [] do
        "Element already in list"
      end
    end

    l ++ [x]

  end

  def append(a,b) do
    a ++ b
  end

end
