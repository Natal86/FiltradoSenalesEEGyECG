%%%%%%%%%%%%%%%%%%%%%%%FUNCION DE FILTRO PASO BAJO%%%%%%%%%%%%%%%%%%%%%%%%%
function [yh,yf,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb)
% % % Wp1=100;          %%%%%Frecuencia de corte del filtro PB%%%%%%%%%%%%%%%%%%%
% % % Ws1=115;          %%%%%Frecuencia de atenuación del filtro PB%%%%%%%%%%%%%%
% % % Rppb=3;           %%%%%Atenuación para la frecuencia de corte en dB PB%%%%%
% % % Rspb=60;          %%%%%Atenuación para la banda rechazada en dB PB%%%%%%%%%    
fe=Fss/2;          %%%%%Frecuencia de Nyquist%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Wppb=Wp1/fe;      %%%%%Frecuencia de corte normalizada de filtro%%%%%%%%%%%
Wspb=Ws1/fe;      %%%%%Frecuencia de atenuación normalizada del filtro%%%%%
[n,Wn]=buttord(Wppb,Wspb,Rppb,Rspb); %%n orden de butterworth Wn fre a 3dB%
[b,a]=butter(n,Wn,'low');    %%coeficientes de butterworth del filtro%%%%%%
[H,W]=freqz(b,a,Fss);
yh=filter(b,a,y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Espectro de Fourier
L=length(y);
NFFT=2^nextpow2(L);                %%%%Siguiente potencia de 2 del vector y
f=Fss/2*linspace(0,1,NFFT/2+1);
yf=fft(y,NFFT)/L;
yf1=fft(yh,NFFT)/L;
