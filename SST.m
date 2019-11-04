function x = SST(A, b)
  % Functia care rezolva un sistem superior triunghiular
  % Intrari:
  %	-> A: matricea sistem
  %	-> b: vectorul termenilor liberi
  % Iesiri: 
  %	-> x: vectorul necunoscutelor
  
  [N, N] = size(A);
  % initializam vectorul solutie si calculam separat valoarea din ultima pozitie
  x = zeros(N, 1);
  x(N) = b(N)/A(N, N);
  % pentru toate celelalte valori, aplicam formula matematica de calcul
  for i = N-1:-1:1
    x(i)=(b(i)-A(i,i+1:N)*x(i+1:N))/A(i,i);
  endfor
endfunction
