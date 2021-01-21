defmodule Fib do

  def fib(n) do
    case n do
      0 -> 0
      1 -> 1
      _ -> fib(n-1) + fib(n-2)
    end
  end

  def bench() do
    ls = [8,10,12,14,16,18,20,22,24,26,28,30,32]
    n = 10

    run = fn(l) ->
      t = time(n, fn() -> fib(l) end)
      :io.format("n: ~4w  fib(n) calculated in: ~8w us~n", [l, t])
    end

    Enum.each(ls, run)
  end

  def time(n, call) do
     {t, _} = :timer.tc(fn -> loop(n, call) end)
     trunc(t/n)
  end

  def loop(0, _ ) do :ok end
  def loop(n, call) do
     call.()
     loop(n-1, call)
  end
end
