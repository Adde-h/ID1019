defmodule Huff do

  def encode([], _) do [] end
  def encode([char|rest], table) do
    code = lookup(table, char)
    code ++ encode(rest, table)
  end

  def lookup([{char, code}|_], char) do code end
  def lookup([_|rest], char) do lookup(rest, char) end

  def table(tree) do traverse(tree, [], []) end

  def traverse({:leaf, char}, code, table) do [{char, reverse(code)}|table] end

  def traverse({:node, left, right}, code, table) do
    traverse(right, [1|code], traverse(left, [0|code], table))
  end

  def reverse(rev) do reverse(rev, []) end

  def reverse([], rev) do rev end
  def reverse([h|t], rev) do
    reverse(t,[h|t])
  end

  def huff([{t,_}]) do t end
  def huff([{t1,f1}, {t2,f2} | rest]) do
    huff(insert(rest, {:node, t1,t2}, f1+f2))
  end

  def insert([], e, f) do [{e,f}] end
  def insert([{t,f1}|rest], e, f) do
    if f1 < f do
      [{t, f1}| insert(rest,e,f)]
    else
      [{e,f}, {t,f1}|rest]
    end
  end

end
