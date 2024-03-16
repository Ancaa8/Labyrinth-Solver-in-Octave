function [Link] = get_link_matrix (Labyrinth)
	  m = numel(Labyrinth(:,1));
    n = numel(Labyrinth(1,:));
    a=m*n;
    Link=sparse(a+2,a+2); %matrice rara
    for i=1:m
        for j=1:n
            nod = (i-1)*n+j;
            count=0; %utilizat pentru a numara in cate directii poate merge
            if bitget(Labyrinth(i,j),4)==0
              count++;
            endif
            if bitget(Labyrinth(i,j),3)==0
             count++;
            endif
            if bitget(Labyrinth(i,j),2)==0
             count++;
            endif 
            if bitget(Labyrinth(i,j),1)==0
              count++;
            endif
            if bitget(Labyrinth(i,j),4)==0
                if i == 1
                    Link(nod,a+1) = 1/count; %se calculeaza probabilitate prin impartirea la contorul count
                endif
                if i != 1 && count !=0
                    Link(nod,nod-n) = 1/count;
                endif
            endif
            if bitget(Labyrinth(i,j),3)==0
                if i == m
                    Link(nod,a+1) = 1/count;
                endif
                if i != m && count !=0
                    Link(nod,nod+n) = 1/count;
                endif
            endif
            if bitget(Labyrinth(i,j),2)==0
                if j == n
                    Link(nod,a+2) = 1/count;
                endif
                if j != n && count !=0
                    Link(nod,nod+1) = 1/count;
                endif
            endif
             if bitget(Labyrinth(i,j),1)==0
                if j == 1
                    Link(nod,a+2) = 1/count;
                endif
                if j != 1 && count !=0
                    Link(nod,nod-1) = 1/count;
                endif
            endif
        endfor
      endfor
  Link(a+1,a+1)=1;
  Link(a+2,a+2)=1;
  
endfunction
