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

  def len([]) do 0 end
  def len([_|t]) do
    len(t) + 1
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
      [head|tail] -> append([head, head], duplicate(tail))
    end
  end

  def add(x,[]) do [x] end
  def add(x,[h|t]) do
    if h != x do
      [h|add(x,t)]
    else
      add(x,t)
    end
  end

  def remove(_,[]) do [] end
  def remove(x, [h|t]) do
    if h != x do
      [h|remove(x,t)]
    else
      remove(x, t)
    end
  end

  def append([],y) do y end
  def append([h|t], y) do
    [h|append(t,y)]
  end

  def member(_,[]) do false end
  def member(x,[h|t]) do
    if x == h do
      true
    else
      member(x,t)
    end
  end

  def unique([]) do [] end
  def unique([h|t]) do
    if (member(h,t) == false) do
      [h|unique(t)]
    else
      unique(t)
    end
  end

  def reverse(l) do
    reverse(l, [])
  end

  def reverse([], r) do r end
  def reverse([h | t], r) do
    reverse(t, [h | r])
  end

end
