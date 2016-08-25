function [v c] = numberofvarsandclauses(m)

  v = m^2;
  c = 0;
  
  %* row , column eqns + pairs exclusion*%
  c += 2*m + m*m*(m-1);
  
  %* residue equations + pairs *%
  c += m; %* m residues 0:m-1 *%
  
  R = resgrid(m);
  
  for r = 0:m-1
    nr = length(find(R == r));
    c += nr*(nr-1)/2; %* combinations *%
  end
  
end
