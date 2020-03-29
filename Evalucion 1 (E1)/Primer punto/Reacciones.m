function[ra,rb]=Reacciones(a,b,p,w,wt)
%Función para calcular las reacciones en los apoyos de la viga simplemente
%apoyada.
%
% a:  Ordenada del apoyo a.
% b:  Ordenada del apoyo b.
% p:  Vector de carga puntual p = [Magnitud, Ordenada].
% w:  Vector de carga homogenea distribuida w = [Magnitud, Ordenada inicial, Ordenada final].
% wt: Vector de carga distributida triangular wt = [Magnitud, Ordenada inicial, Ordenada final].
% ra: Magnitud de la reacción en el apoyo a.
% rb: Magnitud de la reacción en el apoyo b.
%
%-------------------------------------------------------------------------------
%
%Reacciones debidas a la carga puntual p.
rb1=(p(1)*p(2))/b;
ra1=p(1)-rb1;
%Reacciones debidas a la carga homogenea distribuida w.
rb2=(w(1)*(w(3)-w(2))*(w(2)+((w(3)-w(2))/2))/b);
ra2=(w(1)*(w(3)-w(2)))-rb2;
%Reacciones debidas a la carga triangular wt.
rb3=((wt(1)*(wt(3)-wt(2)))/2*(wt(2)+((wt(3)-wt(2))*2/3))/b);
ra3=(w(1)*(w(3)-w(2))/2)-rb3;
%Superposición de los efectos de las cargas.
ra=ra1+ra2+ra3;
rb=rb1+rb2+rb3;
end
