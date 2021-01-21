defmodule Ackermann do

  def ack(m,n) do
    case m do
      0 -> n+1
      m when (m > 0) and (n == 0) -> ack(m-1, 1)
      _ -> ack(m-1, ack(m, n-1))
    end
  end

end
