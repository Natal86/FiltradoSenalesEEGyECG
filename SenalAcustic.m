function [xx sen]=SenalAcustic(T,Fs)
sen=input('Ingrese numero de se�ales');
for i=1:sen
    input('Presione para Grabar se�al (...)')
    xx(:,i)=wavrecord(T*Fs,Fs,1);
end
for i=1:sen
    input('escuchar se�al')
    sound(xx(:,i),Fs)
end