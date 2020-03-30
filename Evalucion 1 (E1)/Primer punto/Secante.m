function [r,iter,ea] = Secante(fun,x0,delta,iMax,Tol,ra,rb,p,w,wt,b)
%SECANTE Método numérico abierto para encontrar raices de funciones.
%   fun:    Función obejitvo a la cual se quiere encontrar la raíz.
%   x0:     Valor inicial de la variable para comenzar el método
%           (El valor debe ser difetente de cero).
if x0 == 0
    error('X0 debe ser diferente de cero.')
else
%   delta:  Cambio fraccionario de la variable independiente.
%   iMax:   Máximo número de iteraciones antes de detener el método.
%   Tol:    Tolerancia mínima para el error aproximado del método.
%   r:      Raíz de la función objetivo.
%   iter:   Número de iteraciones realizadas por el método antes de
%           detenerse.
%   ea:     Error aproximado del método
%--------------------------------------------------------------------------
%   Definir variables locales
xv = x0;    %Valor viejo de x
%   Ciclo con una condición
for i =0: iMax
    xn = xv - (delta*xv /(feval(fun,xv + delta*xv,ra,rb,p,w,wt,b) - ...
    feval(fun,xv,ra,rb,p,w,wt,b))) * feval(fun,xv,ra,rb,p,w,wt,b);
    ea = abs((xn - xv)/xv * 100);
    if ea <= Tol %Condicional para salir del ciclo
        break
    end
    xv = xn;
    i = i+1;
end
[r] = xn;
[iter] = i;
[ea] = ea;
fprintf('iteracion: %d ,  r: %f ,  ea: %.3g%% \n', iter, r,  ea);
end
end
