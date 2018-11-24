% Borcea Rares Ioan, 314CC

function B = GramSchmidt(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% In urma factorizarii QR, A va deveni produs de o matrice ortogonala si una superior triunghiulara,
  % iar prin inmultirea la stanga cu Q' in Q*R*x(i) = e(i), vom obtine un SST, a carui rezolvare ne va
  % ajuta sa calculam, pe rand, coloanele din matricea inversa
  
  % aplicarea algoritmului Gram-Schmidt optimizat
  [N N]=size(A);
	Q = A; % va fi ortogonala
	R = zeros(N); % va fi superior triunghiulara
  B = zeros(N); % B va fi matricea inversa
  I = eye(N); % matricea unitate
  
  % calculul matricelor Q si R pe baza metodei Gram-Schmidt
	for i = 1:N
		R(i,i) = norm(Q(1:N,i));
    for k = 1:N
		  Q(k,i) = Q(k,i) / R(i,i);
    endfor
	  for j = i+1:N
		  R(i,j) = Q(1:N,i)' * Q(1:N,j);
      for k = 1:N
		    Q(k,j) = Q(k,j) - Q(k,i) * R(i,j);
      endfor
    endfor
  endfor

  % rezolvam cate un SST pentru aflarea fiecarei coloane din matricea inversa
  for j = 1:N
    b = Q' * I(1:N, j);
    B(1:N, j) = SST(R, b);
  endfor
endfunction