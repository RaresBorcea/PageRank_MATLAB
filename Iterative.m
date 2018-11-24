% Borcea Rares Ioan, 314CC

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	
  % deschiderea fisierului, citirea lui N, initializarea matricelor
  file = fopen(nume,'r');
  line = fgetl(file);
  N = sscanf(line, '%d', 1);
  A = zeros(N); % matricea de adiacenta
  K = zeros(N);
  One = ones(N, 1); % vectorul coloana 1
  
  % citirea linie cu linie, crearea matricei de adiacenta, inchiderea fisierului
  for i = 1:N
    line = fgetl(file);
    % transpunerea sirului de caractere intr-un vector int
    v = sscanf(line, '%d');
    v = v';
    % matricea K va contine numarul de vecini al fiecarui nod
    K(i, i) = v(2);
    % vecinii incep propriu-zis de la pozitia a III-a in vector
    % deci vom sari peste 2 pozitii
    for j = 3:(v(2) + 2)
      A(i, v(j)) = 1;
    endfor
  endfor
  fclose(file);
  
  % daca exista pagina care trimite spre sine, modificam matricea de adiacenta A
  % si numarul de vecini din matricea K
  for i = 1:N
    if A(i, i) != 0
      A(i, i) = 0;
      K(i, i) = K(i, i) - 1;
    endif
  endfor
  
  % initializam vectorului R(t) conform algoritmului, inversam K, calculam M
  Rt = zeros(N, 1);
  Rt1 = zeros(N, 1);
  Rt(1:N) = 1/N;
  K(1:N, 1:N) = K(1:N, 1:N)^(-1);
  M = K * A;
  M = M';
  
  % aplicam algoritmul, verificand, la fiecare pas, conditia de oprire
  while 1
    Rt1 = d * M * Rt + (1 - d)/N * One;
    if norm(Rt1 - Rt) < eps
      break
    endif
    Rt = Rt1;
  endwhile
  
  R = Rt;
endfunction