function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

  % deschiderea fisierului, citirea lui N, initializarea matricelor
  file = fopen(nume,'r');
  line = fgetl(file);
  N = sscanf(line, '%d', 1);
  A = zeros(N); % matricea de adiacenta
  K = zeros(N);
  One = ones(N, 1); % vectorul coloana 1
  R = zeros(N, 1); % vectorul PageRank
  I = eye(N); % matricea unitate
  
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
  
  % inversam matricea K, calculam M
  K(1:N, 1:N) = K(1:N, 1:N)^(-1);
  M = K * A;
  M = M';
  
  % efectuam calculul propus in metoda
  Inver = GramSchmidt(I - d * M);
  R = Inver * ((1 - d)/N * One);
endfunction
