% Borcea Rares Ioan, 314CC

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
  % concatenam pentru obtinerea numelui fisierului de iesire
  file_out = sprintf('%s.out', nume);
  % aplicam cele 2 metode pentru calcularea PageRank-urilor
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  
  % parcurgem fisierul de intrare si extragem val1 si val2 pentru cerinta 3
  file = fopen(nume,'r');
  line = fgetl(file);
  N = sscanf(line, '%d', 1);
  for i = 1:N+1
    line = fgetl(file);
  endfor
  val1 = sscanf(line, '%f', 1);
  line = fgetl(file);
  val2 = sscanf(line, '%f', 1);
  fclose(file);
  
  % scriem numarul N si vectorii PageRank in fisierul de iesire, respectand spatierea
  file = fopen(file_out,'w');
  fprintf(file, '%d\n\n', N);
  fprintf(file, '%.6f\n', R1);
  fprintf(file, '\n');
  fprintf(file, '%.6f\n', R2);
  fprintf(file, '\n');
  
  % sortam descrescator al doilea vector PageRank si calculam gradul de apartenenta
  % in I retinem pozitia valorilor in vectorul nesortat
  [PR1 I] = sort(R2, 'descend');
  for i = 1:N
    u = Apartenenta(PR1(i), val1, val2);
    % scriem datele in fisierul de iesire, conform cerintei 3
    fprintf(file, '%d %d %.6f\n', i, I(i), u);
  endfor
  
  fclose(file);
endfunction