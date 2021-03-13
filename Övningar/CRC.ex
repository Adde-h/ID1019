defmodule CRC do

  # Our generator
  def generator() do
    [1,0,1,1]
  end

  # Adds 3 zeros in end
  def compute([h|t]) do
    startxor([h|t] ++ [0,0,0])
  end

  # Our XOR function
  def xor(x,x) do 0 end
  def xor(_, _) do 1 end

  # Selects first 4 bits and XOR them
  def startxor(list) do

    gen = generator()
    listlength = Enum.count(list)

    cond do
      listlength > 3 ->
        xor(list, gen, Enum.count(gen), [])
      listlength <= 3 ->
        list
    end
  end

  # Basecase when the first 4 bits has been XOR:ed
  def xor(binary, _, 0, list) do
    confirm(list ++ binary)
  end

  # Our main XOR function when XOR:ing first 4 bits
  def xor([h|t], [h1|t1], n, list) do
    newlist = list ++ [xor(h,h1)]
    xor(t, t1, n-1, newlist)
  end

  # Function checking zeros in the beginning and removing them
  def confirm(list) do

    cond do
      Enum.count(list) > 3 ->
        [h|t] = list
        cond do
          h == 0 ->
            confirm(t)
          h == 1 ->
            startxor([h|t])
        end

      Enum.count(list) <= 3 ->
        list
    end
  end

end
