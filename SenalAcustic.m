function [xx sen]=SenalAcustic(T,Fs)
sen=input('Ingrese numero de señales');
for i=1:sen
    input('Presione para Grabar señal (...)')
    xx(:,i)=wavrecord(T*Fs,Fs,1);
end
for i=1:sen
    input('escuchar señal')
    sound(xx(:,i),Fs)
end