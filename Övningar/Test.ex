defmodule Test do

  # Compute the double of a number.
  def double(n) do
    n * 2
  end

  def to_fahren(c) do
    c * 1.8 + 32
  end

  def to_celsius(fahren) do
    (fahren - 32) / 1.8
  end

  def area_rectangle(a, b) do
    a * b
  end

  def area_square(a) do
    area_rectangle(a,a)
  end

  def area_circle(r) do
    r*r*3.1415
  end

end
