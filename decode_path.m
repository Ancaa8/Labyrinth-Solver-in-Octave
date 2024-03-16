function [decoded_path] = decode_path (path, lines, cols)
dim=size(path,2);
decoded_path=zeros(dim-1,2);
for i=1:dim-1
	decoded_path(i,1)=floor((path(i)-1)/cols+1); %formula pentru linie
	decoded_path(i,2)=mod(path(i)-1,cols)+1; %formula pentru coloana
endfor
endfunction