# Labyrinth-Solver-in-Octave


PARSE_LABYRINTH

Mai întâi, funcția deschide fișierul specificat prin apelarea funcției fopen cu argumentele 'r' pentru citire și calea fișierului.
Apoi, primele două numere din fișier sunt citite folosind fscanf cu formatul '%d' și salvate în variabila dimensiuni_matrice, care specifică dimensiunile matricei labirintului.
O matrice rară cu dimensiunile specificate este inițializată folosind funcția sparse.
Următorul bloc de cod îl parcurge pe fiecare rând și coloană a matricei și citește fiecare valoare întreagă din fișier cu ajutorul funcției fscanf. Aceste valori sunt salvate în matricea Labyrinth corespunzătoare rândului și coloanei curente.
În cele din urmă, funcția închide fișierul cu apelul funcției fclose și returnează matricea rară Labyrinth.

GET_ADJACENCY_MATRIX

Mai întâi, funcția determină numărul de rânduri și coloane ale matricei labirintului folosind funcția numel. Apoi, se calculează numărul total de noduri în labirint prin înmulțirea numărului de rânduri cu numărul de coloane, și se adaugă două noduri suplimentare, WIN si LOSE.
O matrice rară Adj cu dimensiunea a+2 x a+2 este inițializată folosind funcția sparse.
Următorul bloc de cod parcurge fiecare nod din labirint și verifică dacă există o cale de la acest nod la un alt nod. Dacă există o cale, matricea de adiacență este actualizată cu valoarea 1 corespunzătoare.
Valorile 1 sunt plasate în matricea de adiacență Adj în funcție de bitii valorii fiecărui nod din matricea Labyrinth cu ajutorul funcției bitget.
În final, matricea Adj este actualizată cu valorile 1 corespunzătoare nodurilor de WIN si LOSE. 

GET_LINK_MATRIX

Această funcție primește ca intrare matricea Labyrinth și returnează matricea de legături Link. Funcția calculează matricea de legături pentru graficul labirintului, folosind valoarea bit în codificarea Labyrinth-ului pentru a determina dacă o căsuță este sau nu accesibilă. Matricea de legături este o matrice rară, astfel încât valoarea elementelor nenule este calculată ca 1 împărțit la numărul de căsuțe accesibile de la fiecare nod.

GET_JACOBI_PARAMETERS

Această funcție calculează parametrii metodei Jacobi din matricea de link-uri primită ca argument. Acești parametri includ matricea G și vectorul c, care sunt utilizați în algoritmul Jacobi pentru a rezolva sistemul de ecuații liniare asociat matricei de link-uri.
Mai întâi, funcția inițializează dimensiunile matricei Link și creează matricea G cu dimensiunile reduse cu două față de matricea Link. Apoi, pentru fiecare element din matricea G, funcția copiază valoarea corespunzătoare din matricea Link.
Pentru fiecare element din vectorul c, funcția copiază valoarea corespunzătoare din penultima coloană a matricei Link.
La final, funcția returnează matricea G și vectorul c.

PERFORM_ITERATIVE

Această funcție realizează o metodă iterativă de rezolvare a sistemului de ecuații liniare de forma Gx = c, folosind metoda Jacobi. Aceasta primește următoarele parametri: matricea G și vectorul c care definesc sistemul de ecuații, vectorul inițial x0, toleranța dorită tol și numărul maxim de pași max_steps.
Funcția realizează iterații succesive, în care vectorul x este actualizat în fiecare pas prin înmulțirea matricei G cu vectorul x și adăugarea vectorului c. Această iterație continuă până când se atinge toleranța dorită sau numărul maxim de pași este atins.
Funcția returnează vectorul x obținut după iterații, valoarea erorii finale și numărul total de pași efectuați.

HEURISTIC_GREEDY

Funcția începe prin a adăuga poziția de pornire la path, inițializând și vizitat cu toate valorile zero, cu excepția valorii de pe poziția de start, care este setată la 1. În timp ce path nu este gol, se obține ultimul nod adăugat la drum (ultima) și se caută cel mai mare nod adiacent nevizitat, determinat de probabilitățile asociate acestora. Dacă nu există noduri disponibile pentru adăugare, se scoate ultimul nod adăugat la drum (path(end)). În caz contrar, se adaugă nodul la path și se setează valoarea corespunzătoare în vizitat la 1.
Când ultima este egală cu dimensiunea matricei Adj minus 1, funcția se termină și returnează path.

DECODE_PATH

Această funcție primește o cale și dimensiunile unui labirint și decodifică fiecare element al căii într-o pereche de coordonate (linie, coloană) din labirint.
Mai precis, pentru fiecare element din cale, se calculează linia corespunzătoare prin împărțirea la numărul de coloane și adăugarea 1, și coloana prin calculul restului împărțirii elementului minus 1 la numărul de coloane, la care se adaugă 1. Rezultatul este o matrice cu dimensiunea (numărul de elemente din cale - 1) x 2, unde fiecare linie conține perechea de coordonate corespunzătoare elementului din cale.
