% % % %%%%%%FUNCION DE SEÑALES SENOIDALES PURAS SECUENCIALES%%%%%%%%%%%%%%%%%%%%%
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % clc
% % % clear all
% % % close all
% % % fs=8000;     %%Rfecuencia de muestreo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % Ts=1/fs;     %%Periodo de muestreo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [MA]=SecuenciaSenos(fs,Ts)
sen=input('Ingrese numero de señales a construir');
for j=1:sen
num=input('Ingrese numero de señales a sumar');  
for i=1:num
    tono(i,1)=input('Ingrese el tono de cada señal sinusoidal');
end
for i=1:num
    amm(i,1)=input('Ingrese amplitud de cada señal sinusoidal');
end
for i=1:num
    tempo(i,1)=input('Ingrese la duracion de dicha señal');
end
may=max(tempo);
tmax=0:Ts:may;
[M,N]=size(tmax);
for i=1:num
    tm=0:Ts:tempo(i,1);
    y=amm(i,1)*sin(2*pi*tono(i,1)*tm);
    [MM,NN]=size(y);
    dif=N-NN;
    adi=zeros(1,dif);
    Resultat=[y adi];
    Ma(i,:)=Resultat;
end
Ma=Ma';
MAA=Ma(:);
MAA(MAA==0)=[];
MAA=MAA';
MA(j,:)=MAA;
clear Ma
end
if sen==1
figure,plot(MA),title('Señal 1 como suma de senoidales sucesivas');
end
if sen>1
figure,subplot(2,1,1),plot(MA(1,:)),title('Señal 1 como suma de senoidales sucesivas');
subplot(2,1,2),plot(MA(2,:)),title('Señal 2 como suma de senoidales sucesivas');
end
