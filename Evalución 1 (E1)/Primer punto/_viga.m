%Encontrar el punto de inflexion para la viga
%Cargas y apoyos
p=[100 12];         %[carga , ubicacion]
w=[100 3 6];        %[carga , inicio , final]
wt=[100 0 3];
a=0;                %Posicion de apoyos
b=10;
l=12;               %Longitud total

%Reacciones
[ra,rb]=Reacciones(a,b,p,w,wt);

%Ecuacion de Cortante
 function[v]=V(x,ra,rb,p,w,wt)
 if (x<=3)
   v=ra-x*wt(1)/2;
 elseif (x<=6)
   v=ra-wt(1)*3/2-w(1)*(x-3);
 elseif (x<10)
   v=ra-wt(1)*3/2-w(1)*3;
 elseif (x<12)
   v=ra-wt(1)*3/2-w(1)*3+rb;
 elseif (x==12)
   v=ra-wt(1)*3/2-w(1)*3+rb-p(1);
 endif
endfunction
j=1;
 for i=0:0.1:l
   v(j)=V(i,ra,rb,p,w,wt);
   j=j+1;
 endfor
 
%Ecuacion de Momento
 function[M]=M(x,ra,rb,p,w,wt)
 if (x<3)
   M=ra*x-x^3*(wt(1)/(3*6));
 elseif (x<=6)
   M=ra*x-x^3*(wt(1)/(3*6))+(x-3)^3*(wt(1)/(3*6));
 elseif (x<10)
   M=ra*x-x^3*(wt(1)/(3*6))+(x-3)^3*(wt(1)/(3*6))+(x-6)^2*100/2;
 else (x<=12)
   M=ra*x-x^3*(wt(1)/(3*6))+(x-3)^3*(wt(1)/(3*6))+(x-6)^2*100/2+rb*(x-10);
 endif
endfunction


 j=1;
 for i=0:0.1:l
   m(j)=M(i,ra,rb,p,w,wt);
   j=j+1;
 endfor
 paso=[0:0.1:l];
plot(paso,v,paso,m)
