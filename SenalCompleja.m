% % % % clc
% % % % clear all
% % % % close all
%%%%%%%%%%%%%DISEO DE UNA SEÑAL COMPLEJA PARA PROBAR EL ICA%%%%%%%%%%%%%%%%
%Fs=10000;
function [Y]=SenalCompleja(Fs)
se=input('Ingrese numero de señales complejas a elaborar');
for k=1:se
tra=input('Ingrese número de tramos de la señal')
for i=1:tra
    T(i,:)=input('Ingrese duración del tramo en segundos(...)');    
end
op=input('Ingrese vector de ceros (para linea nula en los tramos) y unos (CL de sinusoidales en los tramos)');
op=op';
for i=1:tra;
    if op(i,1)==0
       Ts=1/Fs;     
       t=0:Ts:T(i,1);
       [f,a]=size(t);
       Sen(i,:)=zeros(1,a); 
    end
    if op(i,1)==1
    on=input('Ingrese numero de ondas senoidales que desea sumar en el mismo tramo');
       for j=1:on
           fre(j,1)=input('Ingrese frecuencia');
       end
        for j=1:on
           am(j,1)=input('Ingrese amplitud');
       end
%%%%%%%%%%%%%%%%%%%%%CONSTRUCCIÓN DE LA CL DE SENOIDALES%%%%%%%%%%%%%%%%%%%
       for j=1:on
       Ts=1/Fs;     
       t=0:Ts:T(i,1);
       sen(j,:)=am(j,1)*sin(2*pi*(fre(j,1))*t);
       end
       [xx,yy]=size(sen);
       if on~=1 
         Sen(i,:)=sum(sen);
       end
       if on==1 
         Sen(i,:)=sen(j,:);
       end
    end
end
Se=Sen';
Y(k,:)=Se(:);
end
if se==1
figure,plot(Y'),title('Señal compuesta diseñada por tramos');
end
if se==2
figure,subplot(2,1,1),plot(Y(1,:)),title('Señal 1 compuesta diseñada por tramos');
subplot(2,1,2),plot(Y(2,:)),title('Señal 2 compuesta diseñada por tramos');
end



