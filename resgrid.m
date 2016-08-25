function R = resgrid(m)

  R = zeros(m,m);

  for r = 1:m
    for c = 1:m
      R(r,c) = xkmodm(r,c,m);  
    end
  end 

end
