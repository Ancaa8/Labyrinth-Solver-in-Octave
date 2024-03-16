function [Adj] = get_adjacency_matrix (Labyrinth)
    m = numel(Labyrinth(:,1));
    n = numel(Labyrinth(1,:));
    a=m*n;
    disp(n);
    Adj=sparse(a+2,a+2); %+2 pentru WIN si LOSE
    for i=1:m
        for j=1:n
            nod = (i-1)*n+j;
            %verificarea daca se poate misca in labirint cu functia bitget
            if bitget(Labyrinth(i,j),4)==0
                if i == 1
                    Adj(nod,a+1) = 1;
                endif
                if i != 1
                    Adj(nod,nod-n) = 1; %se misca in sus
                endif
            endif
            if bitget(Labyrinth(i,j),3)==0
                if i == m
                    Adj(nod,a+1) = 1;
                endif
                if i != m
                    Adj(nod,nod+n) = 1; %se misca in jos
                endif
            endif
            if bitget(Labyrinth(i,j),2)==0
                if j == n
                    Adj(nod,a+2) = 1;
                endif
                if j != n
                    Adj(nod,nod+1) = 1; %se misca la dreapta
                endif
            endif
             if bitget(Labyrinth(i,j),1)==0
                if j == 1
                    Adj(nod,a+2) = 1;
                endif
                if j != 1
                    Adj(nod,nod-1) = 1; %se misca la stanga
                endif
            endif
        endfor
    endfor
  Adj(a+1,a+1)=1;
  Adj(a+2,a+2)=1;
endfunction

