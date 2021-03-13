defmodule Q1 do

  def test() do # Returns [:a,:b,:d,:e,:g,:h,:j]
    drop([:a,:b,:c,:d,:e,:f,:g,:h,:i,:j], 3)
  end

  def drop([],_) do [] end
  def drop([_|t], 1) do drop(t,3) end
  def drop([h|t], n) when n > 1 do
    [h|drop(t, n-1)]
  end
end

defmodule Q2 do

  def test() do # Returns [:c,:d,:e,:a,:b]
    rotate([:a,:b,:c,:d,:e], 2)
  end

  def rotate(list, n) when n > 0 do
    rotate(list, n, [])
  end

  def rotate(list, n, rot) do
    cond do
      n > 0  ->
        [h|t] = list
        rot = [h|rot]
        rotate(t, n-1, rot)

      n == 0 ->
        Tuple.append(list,Enum.reverse(rot))
    end
  end
end

defmodule Q3 do

  @type tree() :: {:leaf, any()} | {:node, tree(), tree()}

  def test() do
    nth(3, {:node, {:node, {:leaf, :a}, {:leaf, :b}}, {:leaf, :c}})
  end

  def test2() do
    nth(2, {:node, {:leaf, :a}, {:leaf, :b}})
  end

  def nth(1, {:leaf, val}) do {:found, val} end
  def nth(n, {:leaf, _}) do {:cont, n-1} end

  def nth(n, {:node, left, right}) do
    case nth(n, left) do
      {:found, val} ->
        {:found, val}
      {:cont, k} ->
        nth(k, right)
    end
  end
end


defmodule Q4 do

  @type op() :: :add | :sub
  @type instr() :: integer() | op()
  @type seq() :: [instr()]

  def test() do
    hp35([3, 4, :add, 2, :sub])
  end

  def hp35(list) do hp35(list,[]) end     # Create emptystack
  def hp35([], [stack|_]) do stack end    # If list is empty, print stack

  def hp35([:add|tail], [a,b|stack]) do   # If addition is detected, add upper 2 most val
    hp35(tail, [a+b|stack])
  end

  def hp35([:sub|tail], [a,b|stack]) do   # If subtraction is detected, subtract upper 2 most val
    hp35(tail, [b-a|stack])
  end

  def hp35([val|tail], stack) do          # Push numbers to stack
    hp35(tail, [val|stack])
  end

end

defmodule Q5 do

  def pascal(1) do [1] end
  def pascal(n) do
    [1|next(pascal(n-1))]
  end

  def next([1]) do [1] end
  def next([a|rest]) do
    [b|_] = rest
    [a+b|next(rest)]
  end

end
