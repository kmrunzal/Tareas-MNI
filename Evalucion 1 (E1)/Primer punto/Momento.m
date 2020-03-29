function[M] = Momento(x,ra,rb,p,w,wt,b)
%Función que calcula el valor del momento a una distacia x del extremo derecho
%
% x:  Posición de interés.
% ra: Magnitud de la reacción en el apoyo a.
% rb: Magnitud de la reacción en el apoyo b.
% p:  Vector de carga puntual p = [Magnitud, Ordenada].
% w:  Vector de carga homogenea distribuida w = [Magnitud, Ordenada inicial, Ordenada final].
% wt: Vector de carga distributida triangular wt = [Magnitud, Ordenada inicial, Ordenada final].
% b:  Ordenada del apoyo b.
% M: Magnitud del momento en el punto x.
%
%-------------------------------------------------------------------------------
%
 if x < wt(2)
   M = ra * x;
 elseif wt(2) <= x&&x < wt(3)
   M = ra * x - (1/6 * (x - wt(2) )^3 * wt(1)/(wt(3)-wt(2)) );
 elseif w(2) <= x&&x < w(3)
   M = ra * x - ( (wt(3)-wt(2)) * wt(1) / 2) * (x - wt(3) + (wt(3)-wt(2)) /3)...
       - ( (x - w(2)) * w(1)) * ((x - w(2)) /2);
 elseif (w(3) <= x&&x < b && p(2) > b ) || (w(3) <= x&&x < p(2) && b > p(2) )
   M = ra * x - ( (wt(3)-wt(2)) * wt(1) / 2) * (x - wt(3) + (wt(3)-wt(2)) /3)...
       - ( (w(3) - w(2)) * w(1)) * (x - w(3) + (w(3) - w(2)) /2);
 elseif x >= b && x < p(2)
   M = ra * x - ( (wt(3)-wt(2)) * wt(1) / 2) * (x - wt(3) + (wt(3)-wt(2)) /3)...
       - ( (w(3) - w(2)) * w(1)) * (x - w(3) + (w(3) - w(2)) /2) + rb * (x - b);
 elseif x >= p(2) && x < b
   M = ra * x - ( (wt(3)-wt(2)) * wt(1) / 2) * (x - wt(3) + (wt(3)-wt(2)) /3)...
     - ( (w(3) - w(2)) * w(1)) * (x - w(3) + (w(3) - w(2)) /2) - p(1) * (x - p(2));
 else
   M = 0;
end
end
