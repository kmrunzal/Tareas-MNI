%Script para encontrar la profundidad crítica y de un canal trapezoidal.
%------------------------------------------------------------------------------
%Borrar variables y limpiar la pantalla
clear
clc
%
%Inicializa las varaibles locales con las dimensiones y datos especificados.
  Q = 20;    %Caudal en m3/s.
  g = 9.81;  %Valor de la aceleración de la gravedad en m/s2.
%------------------------------------------------------------------------------
%Método gráfico:
%Se define el rango x y dominio y de la función Y_critico a graficar.
    x = linspace(0.5,2);
    y = Y_critico(Q,g,x);
    ejex = zeros(1,100);    %Crea un vector de ceros para graficar el eje x
%Se grafica la variable x contra y.
  plot(x,y,x,ejex)
