function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	x = x0;
    err = 2*tol;
	steps = 0;
    while steps < max_steps && err> tol
        xaux= x;
        x = G*x + c;
        err = norm(x - xaux);
		steps++;
	endwhile
endfunction
