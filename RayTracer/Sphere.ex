defmodule Sphere do

  defstruct pos: {0, 0, 0}, radius: 2

  defimpl Object do

    def intersect(sphere = %Sphere{}, ray = %Ray{}) do

      vector_k = Vector.sub(sphere.pos, ray.pos)
      lenght_a = Vector.dot(ray.dir, k)
      a2 = :math.pow(a,2)
      k2 = :math.pow(Vector.norm(k), 2)
      r2 = :math.pow(sphere.radius, 2)
      t2 = a2 - k2 + r2
      closest(t2, a)

      defp closest(t2, a) do

        if t2 > 0 do
          t = :math.sqrt(t2)
          d1 = a - t
          d2 = a + t

          cond do
            d1 > 0 && d2 > 0 ->
              {:ok, min(d1,d2)}
            d1 > 0 ->
              {:ok, d1}
            d2 > 0 ->
              {:ok, d2}
            true ->
              :no
          end

        end

        if t2 < 0 do
          :no
        end
      end
    end
  end
end
