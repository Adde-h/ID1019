defmodule Emulator do

  # Denna funktion används endast för Exam 2021-03-19
  def start() do
    compile({{:addi, 1, 0, 10}, {:addi, 3, 0 ,1}, {:out, 3}, {:addi, 1, 1, -1}, {:addi, 4, 3, 0}, {:add, 3, 2, 3}, {:out, 3}, {:beq, 1, 0, 3}, {:addi, 2, 4, 0}, {:beq, 0, 0, -6}, {:halt}})
  end

  def register() do
    {0, 0, 0, 0, 0, 0}
  end

  # Denna funktion ska ladda in instruktionerna som programmet ska köra
  def compile(instr) do
    run(0, instr, register(), [])
  end

  def run(pc, instr, reg, out) do

    case elem(instr,pc) do

    {:addi, rt, rs, imm} ->
      a = elem(reg,rs)
      addreg = put_elem(reg, rt, a + imm)
      run(pc+1, instr, addreg, out)

    {:out, rs} ->
      a = elem(reg,rs)
      out = out ++ [a]
      run(pc+1, instr, reg, out)

    {:add, rd, rs, rt} ->
      a = elem(reg,rs)
      b = elem(reg,rt)
      addreg = put_elem(reg, rd, a + b)
      run(pc+1, instr, addreg, out)

    {:beq, rs, rt, offset} ->
      a = elem(reg, rs)
      b = elem(reg,rt)
      if a == b do
        run(pc+offset, instr, reg, out)
      else
        run(pc+1, instr, reg, out)
      end

    {:halt} ->
      out
    end

  end
end

defmodule Complexity do

  def cut([_]) do 0 end
  def cut([s|seq]) do cut(seq, [s]) end

  def cut([l], right) do
    cut(right) + l + Enum.sum(right)
  end

  def cut(left, right) do
    alt1 = cut(left) + cut(right) + Enum.sum(left) + Enum.sum(right)
    alt2 = cut(tl(left), [hd(left)|right])

    if alt1 < alt2 do
      alt1
    else
      alt2
    end

  end

end
