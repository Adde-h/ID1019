defmodule CRC do

  def generator() do
    [1,0,1,1]
  end

  def compute([h|t]) do
    startxor([h|t] ++ [0,0,0])
  end

  def xor(x,x) do 0 end
  def xor(_, _) do 1 end

  def startxor(list) do
    gen = generator()
    listlength = Enum.count(list)
    cond do
      listlength > 4 ->
        xor(list, gen, Enum.count(gen), [])
      listlength <= 4 ->
        list
    end
  end

  def xor(binary, _, 0, list) do
    confirm(list ++ binary)
  end

  def xor([], _, _, list) do list end

  def xor([h|t], [h1|t1], n, list) do

    newlist = list ++ [xor(h,h1)]
    xor(t, t1, n-1, newlist)

  end

  def confirm([h|t]) do
    cond do
      h == 0 -> confirm(t)
      h == 1 ->
        startxor([h|t])
    end
  end

end
