%Script para encontrar la posición dentro de la viga donde no hay momento.
%------------------------------------------------------------------------------
%Borrar variables y limpiar la pantalla
clear
clc
%Inicializa las varaibles locales con las dimensiones y cargas especificadas.
  p = [100 12];     %[Magnitud , Ordenada].
  w = [100 3 6];    %[Magnitud , Ordenada inicial, Ordenada final].
  wt = [100 0 3];   %[Magnitud, Ordenada inicial, Ordenada final].
  a = 0;            %Ordenada del apoyo a.
  b = 10;           %Ordenada del apoyo b.
  L = 12;           %Longitud total.
%
%Llama a la función Reacciones y guarda las magnitudes en variables locales
[ra,rb]=Reacciones(a,b,p,w,wt);
%
%Se definen las variables de la funcion Secante
%
fun=@Momento;
x0=L/2;     %Valor inicial de la variable para comenzar el método
delta=0.1;  %Cambio fraccionario de la variable independiente.
iMax=10;    %Máximo número de iteraciones antes de detener el método.
Tol=0.1;    %Tolerancia mínima para el error aproximado del método.
%
%Llama a la función Secante para encontrar el cero de la funcion Momento.
%
[r,iter,ea] = Secante(fun,x0,delta,iMax,Tol,ra,rb,p,w,wt,b);
