function [Labyrinth] = parse_labyrinth(file_path)
    file = fopen(file_path, 'r');
    dimensiuni_matrice = fscanf(file, '%d', [1 2])
    Labyrinth=sparse(dimensiuni_matrice(1),dimensiuni_matrice(2))
    for i=1:dimensiuni_matrice(1)
        for j=1:dimensiuni_matrice(2)
          Labyrinth(i,j)=fscanf(file, "%d" , 1);
        endfor
    endfor
    fclose(file);
endfunction
