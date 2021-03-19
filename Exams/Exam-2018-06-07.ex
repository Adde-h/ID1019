defmodule Q4 do

  def fizzbuzz(n) do fizzbuzz(1, n+1, 1, 1) end

  def fizzbuzz(fin, fin, _, _) do [] end

  def fizzbuzz(next, fin, 3, 5) do
    [:fizzbuzz|fizzbuzz(next+1, fin, 1, 1)]
  end

  def fizzbuzz(next, fin, 3, five) do
    [:fizz|fizzbuzz(next+1, fin, 1, five+1)]
  end

  def fizzbuzz(next, fin, three, 5) do
    [:buzz|fizzbuzz(next+1, fin, three+1, 1)]
  end

  def fizzbuzz(next, fin, three, five) do
    [next|fizzbuzz(next+1, fin, three+1, five+1)]
  end

end

defmodule Q5 do

  def fairly(nil) do {:ok, 0} end
  def fairly({:node, _, left, right}) do
    case fairly(left) do
      {:ok, l} ->
        case fairly(right) do
          {:ok, r} ->
            if abs(r-1) < 2 do
              {:ok, 1 + max(l,r)}
            else
              :no
            end
            :no -> :no
        end
        :no -> :no
    end
  end
end

defmodule Q6 do

  pid1 = spawn(fn()->foldp()end)
  pid2 = spawn(fn()->foldp()end)

  def foldp(list) do

  end

end
