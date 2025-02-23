defmodule Tree do

  def delete(key, {:node, key, _, :nil, :nil}) do
    :nil
  end

  def delete(key, {:node, key, _, :nil, right}) do
    right
  end

  def delete(key, {:node, key, _, left, :nil}) do
    left
  end

  def delete(key, {:node, key, _, left, right}) do
    {:node, left, right}
  end

  def delete(key, {:node, k, v, left, right}) do
    if key < k do
      {:node, k, v, delete(key, left), right}
    else
      {:node, k, v, left, delete(key, right)}
    end
  end

  def delete(key, {:node, key, _, left, right}) do
    {k,v} = ...
    deleted = ...
    {:node, ..., ..., ..., ...}
  end

  def insert(key, value, :nil) do {:node, key, value, :nill, :nill} end
  def insert(key, value, {:node, k, v, left, right}) do
    if key < k do
      {:node, k, v, insert(key, value, left), right}
    else
      {:node, k, v, left, insert(key, value, right)}
    end
  end

  def modify(_, _, :nil) do :nil end
  def modify(key, value, {:node, key, _, left, right}) do
    {:node, key, value, left, right}
  end

  def modify(key, value, {:node, k, v, left, right}) do
    if key < k do
      {:node, k, v, modify(key, value, left), right}
    else
      {:node, k, v, left, modify(key, value, right)}
    end
  end

  def lookup(_,:nil) do :no end
  def lookup(key, {:node, key, value, _, _}) do {:value, value} end
  def lookup(key, {:node, k, _, left, right}) do
    if key < k do
      lookup(key, left)
    else
      lookup(key, right)
    end
  end

end
