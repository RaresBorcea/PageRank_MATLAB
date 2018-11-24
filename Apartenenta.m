% Borcea Rares Ioan, 314CC

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
	
  % analizam cele 3 cazuri
  if x < val1
    y = 0;
  % a si b au fost calculate astfel incat sa pastram continuitatea functiei
  elseif x >= val1 && x <= val2
    y = (x - val1)/(val2 - val1);
  elseif x > val2
    y = 1;
  endif
endfunction  