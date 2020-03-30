function [r] = Y_critico (Q,g,y)
%Numero de Freude de un canal trapezoidal con altura critica expresado como una
%funcion igualada a cero.
%
% Q:    Caudal en m3/s.
% g:    Aceleracion de la gravedad en m/s2.
% y:    Altura de la lamina de agua en m.
% r:    Diferencia entre el nummero de Freude de una sección critica y una con
%       altura y.
%
%------------------------------------------------------------------------------
%
%Se definen las funciones geometricas de área y el ancho supercial.
  B = 3 + y;
  Ac = 3.*y + y.^2 ./2;
%Se define la funcion que debe ser igualada a cero. (r debe ser igual a cero)
  r = 1 - Q^2 ./ (g.*Ac.^3) .* B;
