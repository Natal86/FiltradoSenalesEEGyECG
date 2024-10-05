% % % % %%%%%%%%%%%%DIAGRAMA DE RESPUESTA EN FRECUENCIA DE TODOS LOS FILTROS%%%%%%%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % clc
% % % % clear all
% % % % close all
% % % % % % Res=[ 1 1 1 1];
% % % % % % T=1
% % % % % % Fs=600;
% % % % % % Fss=Fs;
% % % % % % Fsss=Fss;
% % % % % % Fssss=Fsss;
% % % % % % Wppa=2.5;
% % % % % % Wspa=0.5;
% % % % % % Rppa=3;
% % % % % % Rspa=60;
% % % % % % Wp1=100;          %%%%%Frecuencia de corte del filtro PB%%%%%%%%%%%%%%%%%%%
% % % % % % Ws1=115;          %%%%%Frecuencia de atenuación del filtro PB%%%%%%%%%%%%%%
% % % % % % Rppb=3;           %%%%%Atenuación para la frecuencia de corte en dB PB%%%%%
% % % % % % Rspb=60;
% % % % % % Wp1p=58;
% % % % % % Wp2p=65;
% % % % % % Ws1s=60;
% % % % % % Ws2s=61;
% % % % % % Rpp2=3;            %%%%%Atenuación para la banda rechazada en dB RB%%%%%%%%
% % % % % % Rss2=40; 
% % % % % % W1p=2;                 %%%%Normalizar bandas de frecuencia%%%%%%%%%
% % % % % % W2p=100;
% % % % % % W1s=0.5;               %%%%Normalizar bandas de frecuencia%%%%%%%%%
% % % % % % W2s=250;
% % % % % % Rp=3;                          %%%%Atenuación en la banda de paso%%%%%%%%%%
% % % % % % Rs=40;
% % % % % % [y]=SumaSinusoidal(T,Fs)
function [a1]=EspectroSenales(Wppa,Wspa,Rppa,Rspa,Res,Fs,Fss,Fsss,Fssss,Wp1,Ws1,Rppb,Rspb,W1p,W2p,W1s,W2s,Rp,Rs,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2,y);
%%%%%%%%%%%%%%%%%VECTORES DE OPCIONES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%VECTORES DE OPCIONES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1=[1 1 1 1];a2=[1 1 0 0];a3=[1 0 1 0];a4=[1 0 0 1];a5=[0 1 1 0];a6=[0 1 0 1];
a7=[0 0 1 1];a8=[1 1 1 0];a9=[1 0 1 1];a10=[1 1 0 1];a11=[0 1 1 1];a12=[1 0 0 0];
a13=[0 1 0 0];a14=[0 0 1 0];a15=[0 0 0 1];
%%%%%%%%%%%%%%%CREACION DE VECTORES ALEATORIOS PARA SEÑALES%%%%%%%%%%%%%%%%
yh=y;
yhh=yh;
yhhh=yhh;
if Res==a1 
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   figure,subplot(5,1,1),plot(f,2*abs(yfs1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(5,1,2),plot(f,2*abs(yf1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Bajo')
   subplot(5,1,3),plot(f,2*abs(yf2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Alto')
   subplot(5,1,4),plot(f,2*abs(yf3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Banda')
   subplot(5,1,5),plot(f,2*abs(yf4(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Notch')
end
if Res==a2 
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   yhhh=yh;
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   figure,subplot(3,1,1),plot(f,2*abs(yfs1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(3,1,2),plot(f,2*abs(yf1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Bajo')
   subplot(3,1,3),plot(f,2*abs(yf4(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Alto')   
end
if Res==a3 
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   yhh=yh;
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   figure,subplot(3,1,1),plot(f,2*abs(yfs1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(3,1,2),plot(f,2*abs(yf1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Bajo')
   subplot(3,1,3),plot(f,2*abs(yf3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Banda') 
end
if Res==a4 
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(3,1,1),plot(f,2*abs(yfs1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(3,1,2),plot(f,2*abs(yf1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Bajo')
   subplot(3,1,3),plot(f,2*abs(yf2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Notch') 
end
if Res==a5
    yhh=y;
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   yhhhh=yhhh;
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   figure,subplot(3,1,1),plot(f,2*abs(yfs3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(3,1,2),plot(f,2*abs(yf3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Banda')
   subplot(3,1,3),plot(f,2*abs(yf4(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Alto') 
end
if Res==a6
    yhhh=y;
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   yhh=yhhhh;
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(3,1,1),plot(f,2*abs(yfs4(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(3,1,2),plot(f,2*abs(yf4(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Alto')
   subplot(3,1,3),plot(f,2*abs(yf2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Notch') 
end
if Res==a7
    yhh=y;
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   yhh=yhhh;
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(3,1,1),plot(f,2*abs(yfs3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(3,1,2),plot(f,2*abs(yf3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Banda')
   subplot(3,1,3),plot(f,2*abs(yf2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Notch') ;
end
if Res==a8
    [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   yhhh=yh;
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   yhh=yhhhh;
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   figure,subplot(4,1,1),plot(f,2*abs(yfs1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(4,1,2),plot(f,2*abs(yf1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Bajo')
   subplot(4,1,3),plot(f,2*abs(yf4(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Alto') 
   subplot(4,1,4),plot(f,2*abs(yf3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Banda') 
end
if Res==a9
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   figure,subplot(4,1,1),plot(f,2*abs(yfs1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(4,1,2),plot(f,2*abs(yf1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Bajo')
   subplot(4,1,3),plot(f,2*abs(yf2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Notch') 
   subplot(4,1,4),plot(f,2*abs(yf3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Banda') 
end
if Res==a10
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   yhhh=yhh;
   figure,subplot(3,1,1),plot(f,2*abs(yfs1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(3,1,2),plot(f,2*abs(yf1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Bajo')
   subplot(3,1,3),plot(f,2*abs(yf2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Notch')    
end
if Res==a11
    yhh=y;
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   yh=yhhh;
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(3,1,1),plot(f,2*abs(yfs3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(3,1,2),plot(f,2*abs(yf3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Banda')
   subplot(3,1,3),plot(f,2*abs(yf2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Notch')
end
if Res==a12
    [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   figure,subplot(2,1,1),plot(f,2*abs(yfs1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(2,1,2),plot(f,2*abs(yf1(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Bajo')
end
if Res==a13
    yhhh=y;
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   figure,subplot(2,1,1),plot(f,2*abs(yfs4(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(2,1,2),plot(f,2*abs(yf4(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Paso Alto')
   end
if Res==a14
    yhh=y;
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   figure,subplot(2,1,1),plot(f,2*abs(yfs3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(2,1,2),plot(f,2*abs(yf3(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Pasa Banda')
end
if Res==a15
    yh=y;
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(2,1,1),plot(f,2*abs(yfs2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal sin Filtrar')
   subplot(2,1,2),plot(f,2*abs(yf2(1:NFFT/2+1))),ylabel('Modulo H(z)'),title('Espectro de Potencia Señal filtrada con Filtro Notch')
end