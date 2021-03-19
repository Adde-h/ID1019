defmodule Q1 do

  def test() do
    decode([{:a, 2}, {:c, 1}, {:b, 3}, {:a, 1}])
  end

  def decode(code) do
    decode(code, [])
  end

  def append([{_char, 0}|t], list) do decode(t, list) end
  def append([{char, num}|t], list) do
    list = list ++ [char]
    append([{char, num-1}|t], list)
  end

  def decode([], list) do list end
  def decode([{char, num}|t], list) do
    append([{char, num}|t], list)
  end

end

defmodule Q2 do

  def test() do
    zip([:a,:b,:c], [1,2,3])
  end

 def zip([], []) do [] end
 def zip([h1|tail1], [h2|tail2]) do
    [{h1,h2}|zip(tail1,tail2)]
  end

end

defmodule Q3 do

end

defmodule Q4 do

  def test() do
    eval({:add, {:mul, 2, 3}, {:neg, 2}})
  end

  def eval({:add, exp, exp2}) do
    eval(exp) + eval(exp2)
  end

  def eval({:mul, exp, exp2}) do
    eval(exp) * eval(exp2)
  end

  def eval({:neg, exp}) do
    eval(exp) * -1
  end

  def eval(val) do val end

end

defmodule Q5 do

  def gray(0) do [[]] end
  def gray(n) do
    og = gray(n-1)
    rev = Enum.reverse(og)
    update(og, 0) ++ update(rev, 1)
  end

  def update([],_) do [] end
  def update([h|t], n) do
   [[n|h]|update(t,n)]
  end

end
