%* x^k mod m *%
function y = xkmodm(x,k,m)

  if (k == 0) y = 1; return; end;
  if (k == 1) y = mod(x,m); return; end;

  r = mod(k,2);
  k2 = floor(k/2);
  y1 = xkmodm(x,k2,m);
  y = mod(y1*y1,m);
  if (r == 1) y = mod(y*x,m); end;

end
