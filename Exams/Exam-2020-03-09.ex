defmodule Q1 do

  def test() do
    toggla([:a,:b,:c,:d,:e,:f,:g])
  end

  def toggla([]) do [] end
  def toggla([h]) do [h] end
  def toggla([h,h2|t]) do ## [:a,:b,:c,:d,:e,:f,:g])
    [h2,h|toggla(t)]
  end

end

defmodule Q2 do

  def test() do
    push(1,[2,3,4])
    push(1,[])
    push(1,[2,3,[4,5]])

    pop([1,2,3,4])
    pop([1])
  end

  def push(x, []) do [x] end
  def push(x, [h|t]) do [x,h|t] end

  def pop([]) do {:no} end
  def pop([h|t]) do {:ok, h, t} end
end

defmodule Q3 do

  def test() do
    flatten([1,[2],[[3,[4,5]], 6]])
  end

  def flatten ([]) do [] end
  def flatten([h|t]) do
    flatten(h) ++ flatten(t)
  end
  def flatten (x) do [x] end

end

defmodule Q4 do

  def test() do
    index([12,10,8,8,6,4,4,4,2])
  end

  def index([h|t]) do
    count([h|t], 0)
  end

  def count([h|t], val) do
    if(h > val) do
      val = val + 1
      count(t, val)
    else
      val
    end

    end
end

defmodule Q5 do

  @type tree() :: :nil | {:node, tree(), tree()} | {:leaf, any()}

  def test() do
    compact({:node, {:leaf, 4}, {:leaf, 4}})
  end

  def test2() do
    compact({:node, {:leaf, 5}, {:node, :nil, {:leaf, 4}}})
  end

  def compact (:nil) do :nil end

  def compact({:node, left, right}) do
   cl = compact(left)
   cr = compact(right)
   combine(cl, cr)
  end

  def compact({:leaf, value}) do
    {:leaf, value}
  end

  def combine(:nil, {:leaf, value}) do
    {:leaf, value}
  end

  def combine({:leaf, value}, nil) do
    {:leaf, value}
  end

  def combine({:leaf, value}, {:leaf, value}) do
    {:leaf, value}
  end

  def combine(left, right) do
    {:node, left, right}
  end

end
