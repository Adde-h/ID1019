defmodule Recursion do

  def prod(a,b) do

    if a == 0 do
      0
    else
      if a < 0 do
        prod(a+1, b) - b
      else
        prod(a-1, b) + b
      end
    end

  end

  def fib(n) do
    if n == 0 do
      0
    else
      if n == 1 do
        1
      else
        fib(n-1) + fib(n-2)
      end
    end
  end

  def fib2(n) do
    case n do
      0 -> 0
      1 -> 1
      _ -> fib(n-1) + fib(n-2)
    end
  end

  def sum(x) do
    case x do
      {} -> 0
      {a} -> a
      {a,b} -> a+b
      {a,b,c} -> a+b+c
      {a,b,c,d} -> a+b+c+d
      error -> {:error, error}
    end
  end

  def age(x) do
    case x do
      {:person, a, _} -> a
      _ -> :error
    end
  end

  def exp(x,y) do
    case y do
      1 -> x
      0 -> 1
      _ -> exp(prod(x,x),y-1)
    end
  end

  def qexp(x,y) do
    if (y > 0) && (y < 2) do
      case y do
        1 -> x
        0 -> 1
      end
    else
      if rem(y,2) == 0 do
        prod(qexp(x,div(y,2)), qexp(x,div(y,2)))
      else
        y = y+1
        div(prod(qexp(x,div(y,2)), qexp(x,div(y,2))),x)
      end
    end
  end
end
