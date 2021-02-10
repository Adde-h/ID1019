defmodule Env do

  def new() do [] end

  def add(id, str, []) do
    [{id, str}]
  end

  def add(id, str, [h|t]) do
    [{id, str}, h, t]
  end

  def lookup(_, []) do :nil end
  def lookup(id,[{id, str}|_]) do {id, str} end
  def lookup(id,[_|rest]) do
    lookup(id, rest)
  end

  def remove(_, []) do [] end
  def remove(ids, [{ids, _}|t]) do t end
  def remove(ids, [h|rest]) do
    [h|remove(ids,rest)]
  end

end
