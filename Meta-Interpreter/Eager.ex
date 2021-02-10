defmodule Eager do

  def eval_expr({:atm, id}, []) do {:ok, id} end

  def eval_expr({:var, _}, []) do :error end
  def eval_expr({:var, _}, [{var,str}|_]) do
    case {var,str} do
      nil ->
        :error
      {_, str} ->
        {:ok, str}
    end
  end

  def eval_expr({:cons, {:var, str}, {:atm, ts}}, env) do
    case eval_expr({:var, str}, env) do
      :error ->
        :error
      {:ok, str} ->
        case eval_expr({:atm, ts}, []) do
          :error ->
            :error
          {:ok, ts} ->
            {:ok, {str, ts}}
        end
    end
  end

  def eval_match({:atm, id}, id, []) do [{:ok, [] }] end
  def eval_match(:ignore, {:atm, id}, {:atm, id2}) do
    {:ok, id}
  end

  def eval_match({:var, str}, id, []) do [{:ok, [{str, id}]}] end
  def eval_match({:var, str}, id, [{str, id}|rest]) do
    {:ok, [{str, id}]}
  end

  def eval_match({:var, str}, id, [{str, id2}|_]) do :fail end
  def eval_match({:cons, {:var, x}, {:var, x}}, {:cons, {:atm, a}, {:atm, b}}, []) do :fail end

  def eval_match({:var, id}, str, env) do
    case env do
      nil ->
        {:ok, ...}
      {_, ^str} ->
        {:ok, ...}
      {_, _} ->
        :fail
    end
  end

end
