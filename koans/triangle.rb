def triangle(a, b, c)
  # WRITE THIS CODE
  if a==b && a==c
    return :equilateral
  end
  if (a==b && a!=c) || (a==c && a!=b) || (b==c && b!=a)
    return :isosceles
  end
  if a!=b && a!=c && b!=c
    return :scalene
  end
  if a==0 && b==0 && c==0
    raise TriangleError, "why the exception happened"
  end



end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError

end
