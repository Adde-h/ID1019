defmodule Cmplx do

  def new(r,i) do {r,i} end   # create a complex number
  def add(a,b) do             # a and b being complex numbers (a+bi) + (c+di)
    {a1, a2} = a              # a1 complex, a2 real number
    {b1, b2} = b              # b1 complex, b2 real number
    {a1+b1, a2+b2}            # add complex number seperately and real number seperately
  end

  def sqr(a) do
    {a1, a2} = a              # a1 complex, a2 real number
    :math.pow(a1,2) + 2*a1*a2 + :math.pow(a2,2)
  end

  def abs(a) do
    {a1, a2} = a              # a1 complex, a2 real number
    :math.sqrt(:math.pow(a1,2) + :math.pow(a2,2))
  end

end

defmodule Brot do

  def mandelbrot(c, m) do     # c complex number, m amount of iteration
    z0 = Cmplx.new(0,0)       # define z0 as 0
    i = 0
    test(i, z0, c, m)
  end

  def test(i, _z, _c, m) when i == m do 0 end  # If number of iteration has reached the maximum
  def test(i, z, c, m) do
    case(Cmplx.abs(z) > 2) do
      true -> i
      false ->
        zn = Cmplx.add(Cmplx.sqr(z), c)
        test(i + 1, zn, c, m)
    end


  end

end
