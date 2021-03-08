defmodule Camera do

  defstruct pos: {nil}, corner: nil, right: nil, down: nil, size: nil

end

def normal(size) do
  {width, height} = size
  d = width * 1.2
  h = width / 2
  v = height / 2
  corner = {-h, v, d}
  pos = {0, 0, 0}
  right = {1, 0, 0}
  corner = {-h, v, d}
  down = {0, -1, 0}

  %Camera{pos: pos, corner: corner, right: right, down: down, size: size)
end

def ray(%Camera{pos: pos, corner: corner, right: right, down: down, size: size), x, y) do
  origin = pos                                            # the origin of the ray
  x_pos = Vector.smul(right, x)                           # a vector from the corner to the x column
  y_pos = Vector.smul(down, y)                            # a vector from the corner to the y row
  pixle = Vector.add(corner, Vector.add(x_pos, y_pos))    # a vector from origin to the pixle
  dir = Vector.normalize(pixle)                           # the normalized vector
  %Ray{pos: origin, dir: dir}
end
