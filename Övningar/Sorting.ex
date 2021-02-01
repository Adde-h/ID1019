defmodule Sorting do

  def insert(e,[]) do [e] end
  def insert(e,[h|t]) do
    if e > h do
      [h|insert(e,t)]
    else
      [e,h|t]
    end
  end

  def isort([]) do [] end

  def isort([h|t]) do
    isort([h],t)
  end

  def isort(sorted,unsorted) do
    case unsorted do
      [h|t] -> insert(h, sorted) |> isort(t)
      [] -> sorted
    end
  end

  def msort(l) do #Work In Progress
    case l do
      [h|t] ->
      [head] -> [head]
    end
  end

end
