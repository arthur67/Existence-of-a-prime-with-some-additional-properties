%* p-1 : has 3 or more factors, no squares *%
function pf = primefilter(plist)
  pf = [];
  for k = 1:length(plist)
    p = plist(k);
    f = factor(p-1);
    if (length(f) < 3) continue; end;
    hassquare = 0;
    for j = 1:length(f)
      if (length(find(f == f(j))) >= 2) hassquare = 1; break; end;
    end
    if (hassquare == 1) continue; end
    pf = [pf,p];
  end
end
