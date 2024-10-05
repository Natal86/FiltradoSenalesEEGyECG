%%%%%%%%%%%%%%%%%%%%%%%FUNCION DE FILTRO PASO BAJO%%%%%%%%%%%%%%%%%%%%%%%%%
function [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
% % % Wppa=150;          %%%%%Frecuencia de corte del filtro PB%%%%%%%%%%%%%%%%%%
% % % Wspa=100;          %%%%%Frecuencia de atenuación del filtro PB%%%%%%%%%%%%%
% % % Rppa=3;           %%%%%Atenuación para la frecuencia de corte en dB PB%%%%%
% % % Rspa=60;          %%%%%Atenuación para la banda rechazada en dB PB%%%%%%%%%
fe=Fssss/2;          %%%%%Frecuencia de Nyquist%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wppaa=Wppa/fe;      %%%%%Frecuencia de corte normalizada de filtro%%%%%%%%%%%
Wspaa=Wspa/fe;      %%%%%Frecuencia de atenuación normalizada del filtro%%%%%
[n,Wn]=buttord(Wppaa,Wspaa,Rppa,Rspa); %%n orden de butterworth Wn fre a 3dB%
[b,a]=butter(n,Wn,'high');    %%coeficientes de butterworth del filtro%%%%%%
[HHHH,WWWW]=freqz(b,a,Fssss);
yhhhh=filter(b,a,yhhh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Espectro de Fourier
L=length(yhhh);
NFFT=2^nextpow2(L);                %%%%Siguiente potencia de 2 del vector y
f=Fssss/2*linspace(0,1,NFFT/2+1);
yf4=fft(yhhhh,NFFT)/L;
yfs4=fft(yhhh,NFFT)/L;

