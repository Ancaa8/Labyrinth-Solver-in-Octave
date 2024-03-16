function [G, c] = get_Jacobi_parameters (Link)
m = numel(Link(:,1))
n = numel(Link(1,:))
G=sparse(m-2,n-2) %matrice rara
for i=1:(m-2)
  for j=1:(n-2)
    G(i,j)=Link(i,j);
  endfor
endfor
c=sparse(m-2,1)
for i=1:(m-2)
  c(i,1)=Link(i,n-1)
endfor
endfunction
