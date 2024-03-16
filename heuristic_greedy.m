function [path] = heuristic_greedy(start_position, probabilities, Adj)
dim=size(Adj,1);
path=[start_position];
vizitat=zeros(1,dim);
vizitat(start_position)=1;
while !isempty(path)
ultima=path(end);
if ultima==dim-1
	return;
endif
maxprob=0; %pentru a afla ce vecin are probabilitatea cea mai mare
aux=ultima; %pentru a retine vecinul cu probabilitatea cea mai mare
for j=1:dim-1
		if Adj(ultima,j)==1 && vizitat(j)==0
			if probabilities(j)>maxprob
				maxprob=probabilities(j);
				aux=j;
			endif
		endif
endfor
if maxprob==0
	path(end)=[];
else
	path=[path,aux];
	vizitat(aux)=1;
endif
endwhile
endfunction