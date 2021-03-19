
defmodule Q4 do

  def sum(nil) do 0 end
  def sum({:node, val, left, right}) do
    val + sum(left) + sum(right)
  end

end

defmodule Q6 do

  def start() do
    pid = spawn(fn() -> closed()end)
  end

  def closed() do
    receive do
      2 -> two()
      _ -> closed()
    end
  end

  def two() do
    receive do
      2 -> two()
      4 -> four()
      _ -> closed()
    end
  end

  def four() do
    receive do
      2 -> two()
      6 -> six()
      _ -> closed()
    end
  end

  def six() do
    receive do
      2 -> two()
      _ -> closed()
    end
  end

end
