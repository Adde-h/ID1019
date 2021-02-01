defmodule Queue do

  def new() do [] end

  def add([], elem) do [elem] end
  def add([h|t], elem) do
    [h| add(t,elem)]
  end

  def remove([]) do :error end
  def remove([elem|rest]) do {:ok, elem, rest} end

  def new1() do {:queue, [], []} end

  def add1({:queue, front, back}, elem) do {:queue, front, [elem|back]} end

  def remove1({:queue, [], []}) do :error end
  def remove1({:queue, [], back}) do
    remove1({:queue, reverse(back), []})
  end

  def remove1({:queue, [elem|rest], back}) do
    {:ok, elem, {:queue, rest, back}}
  end

  def reverse(lst) do reverse(lst, []) end
  def reverse([], rev) do rev end
  def reverse([h|t], rev) do reverse(t, [h|rev]) end

end
