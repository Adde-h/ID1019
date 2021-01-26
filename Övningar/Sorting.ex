defmodule Sorting do

  def len([]) do 0 end
  def len([_|t]) do
    len(t) + 1
  end

  def insert(e,[]) do [e] end
  def insert(e,[h|t]) do
    if e > h do
      [h|insert(e,t)]
    else
      [e,h|t]
    end
  end

  def isort([h|t]) do
    insert(h,t)
  end

end
