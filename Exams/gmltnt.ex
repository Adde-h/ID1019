defmodule Luhn do

  def luhn(checklast) do
    first = omsom(checklast)
    firststep = seperate(first)
    second = sum(firststep)

    case rem(second,10) do
    0 -> 0
    _ -> 10 - rem(second,10)
    end
  end

  def seperate([]) do [] end
  def seperate([h|t]) do
    cond do
      h > 9 -> [1, h-10|seperate(t)]
      true -> [h|seperate(t)]
    end
  end

  def omsom(numbers) do omsom(numbers, 2) end
  def omsom([], _) do [] end
  def omsom([h|t], n) do
    case n do
      1->
        [h*n|omsom(t,2)]
      2->
        [h*n|omsom(t,n-1)]
    end
  end

  def sum([]) do 0 end
  def sum([h|t]) do
    h+sum(t)
  end
end
