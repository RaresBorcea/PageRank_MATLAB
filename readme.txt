% Borcea Rareș Ioan, 314CC

Tema 1 MN - PageRank

Rolul acestui material este de a oferi informații asupra implementării algoritmului PageRank în limbajul Matlab, prin intermediul IDE-ului Octave.

(!) Pentru a înțelege în detaliu modul de funcționare al programului, recomandăm coroborarea informației din Readme cu aceea din comentariile alăturate codului.

Ideea generală:
Implementarea algoritmului utilizat de compania Google a fost realizată în două metode, iterativă (Iterative.m) și algebrică (Algebraic.m).
Ambele metode au presupus citirea datelor referitoare la legăturile dintre pagini din fișiere de intrare text, realizarea unor matrice de adiacență, care să reprezinte eficient legăturile dintre paginile web si aplicarea matematică a celor doi algoritmi sugerați în enunțul temei.
Toate funcțiile sunt gestionate de PageRank.m, care memorează vectorii returnați de algoritmi și îi scrie, respectând detaliile din cerință, în fișierele de ieșire.

Funcțiile utilizate:
1) Iterative.m reprezintă prima metodă de calcul al vectorului PageRank. Aceasta citește linie cu linie din fișierele de intrare, parcurgând listele de adiacență, pentru a crea o matrice de adiacență. 
În același timp, completează și diagonala matricei K, ce cuprinde gradele de ieșire (numărul de vecini) ai fiecărui nod din graful paginilor web. 
Ulterior, dacă există pagini cu link-uri spre ele însele, vom rectifica valorile din K și vom completa cu zero-uri diagonala matricei de adiacență. 
Nu în ultimul rând, vom aplica metoda sugerată de algoritm, inițializând vectorii corespunzător și verificând la fiecare pas condiția de oprire.
2) Algebraic.m este cea de-a doua modalitate de calcul al PageRank-ului. Asemănătoare în prelucrarea informațiilor din fișiere cu prima metodă, diferența apare la calculul propriu-zis al vectorului PageRank, de această dată realizându-se într-o singură iterație, pe baza unei formule de calcul.
3) GramSchmidt.m este necesară metodei algebrice, unde avem nevoie să inversăm o matrice. Am aplicat algoritmul Gram-Schmidt pentru că este stabil numeric, spre deosebire de calculul determinanților.
După factorizarea QR, în sistemul Q*R*x(i) = e(i), unde x(i) sunt coloanele din matricea inversată și e(i) sunt coloanele din matricea unitate, dacă înmulțim la stânga cu Q', vom obține câte un sistem superior triunghiular, din care putem calcula, pe rând, coloanele matricei inversate.
4) SST.m - funcția care rezolvăm sistemele superior triunghiulare.
5) Apartenenta.m - funcția în care calculăm gradul de apartenență la mulțimea paginilor importante. 
Pentru ramura a doua, coeficienții a și b au fost calculați astfel încât să păstrăm continuitatea funcției membru, din următorul sistem:
0 = a*val1 + b;
1 = a*val2 + b.
6) PageRank.m este funcția care gestionează apelurile celorlalte, aici reținându-se și cele două valori (val1, val2) necesare în calculul gradului de apartenență.
Tot aici este scris și fișierul de ieșire, respectându-se indicațiile din cerință.

Testarea funcțiilor s-a realizat atât prin rularea individuală a celor două metode PageRank, pe exemple concrete, cât și prin apelul PageRank.m și verificarea fișierelor .out rezultate.