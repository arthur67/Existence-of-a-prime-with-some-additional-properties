function generatecnf(m)

  fname = sprintf("g%d.cnf",m);
  fd = fopen(fname,"w");

  [nv nc] = numberofvarsandclauses(m);
  fprintf(fd,"c prime = %d\n",m/2);
  fprintf(fd,"p cnf %d %d\n",nv,nc);
  
  actualequationcount = 0;
  %* column equations *%
  for c = 1:m
    cidx = [1 + (c-1)*m:1:c*m];
    for k = 1:length(cidx)
      fprintf(fd,"%d ",cidx(k));
    end
    fprintf(fd,"0\n");
    ++actualequationcount;
    
    %* pair wise exclusion*%
    if (length(cidx) >= 2)
      for u = 1:length(cidx)-1
        for v = u+1:length(cidx)
          fprintf(fd,"%d %d 0\n",-cidx(u),-cidx(v));
          ++actualequationcount;
        end
      end
    end
  end
  
  %* row equations *%
  for c = 1:m
    cidx = [c:m:c + (m-1)*m];
    for k = 1:length(cidx)
      fprintf(fd,"%d ",cidx(k));
    end
    fprintf(fd,"0\n");
    ++actualequationcount;
    
    %* pair wise exclusion*%
    if (length(cidx) >= 2)
      for u = 1:length(cidx)-1
        for v = u+1:length(cidx)
          fprintf(fd,"%d %d 0\n",-cidx(u),-cidx(v));
          ++actualequationcount;
        end
      end
    end
  end

  %* residue equations *%
  R = resgrid(m);
  for c = 0:m-1
    cidx = find(R == c);
    for k = 1:length(cidx)
      fprintf(fd,"%d ",cidx(k));
    end
    fprintf(fd,"0\n");
    ++actualequationcount;
    
    %* pair wise exclusion*%
    if (length(cidx) >= 2)
      for u = 1:length(cidx)-1
        for v = u+1:length(cidx)
          fprintf(fd,"%d %d 0\n",-cidx(u),-cidx(v));
          ++actualequationcount;
        end
      end
    end
  end

  
  fclose(fd);
 
  printf("nv = %d nc = %d actualequationcount = %d\n",nv,nc,actualequationcount);
 
end
