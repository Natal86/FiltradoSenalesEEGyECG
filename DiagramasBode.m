% % % % %%%%%%%%%%%%DIAGRAMA DE RESPUESTA EN FRECUENCIA DE TODOS LOS FILTROS%%%%%%%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % clc
% % % % clear all
% % % % close all
% % % % Res=[ 1 1 1 1];
% % % % Fs=600;
% % % % Fss=Fs;
% % % % Fsss=Fss;
% % % % Fssss=Fsss;
% % % % Wp1=100;          %%%%%Frecuencia de corte del filtro PB%%%%%%%%%%%%%%%%%%%
% % % % Ws1=115;          %%%%%Frecuencia de atenuación del filtro PB%%%%%%%%%%%%%%
% % % % Rppb=3;           %%%%%Atenuación para la frecuencia de corte en dB PB%%%%%
% % % % Rspb=60;
% % % % Wp1p=58;
% % % % Wp2p=65;
% % % % Ws1s=60;
% % % % Ws2s=61;
% % % % Rpp2=3;            %%%%%Atenuación para la banda rechazada en dB RB%%%%%%%%
% % % % Rss2=40; 
% % % % W1p=2;                 %%%%Normalizar bandas de frecuencia%%%%%%%%%
% % % % W2p=100;
% % % % W1s=0.5;               %%%%Normalizar bandas de frecuencia%%%%%%%%%
% % % % W2s=250;
% % % % Rp=3;                          %%%%Atenuación en la banda de paso%%%%%%%%%%
% % % % Rs=40;
function [a1]=DiagramasBode(Wppa,Wspa,Rppa,Rspa,Res,Fs,Fss,Fsss,Fssss,Wp1,Ws1,Rppb,Rspb,W1p,W2p,W1s,W2s,Rp,Rs,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
%%%%%%%%%%%%%%%%%VECTORES DE OPCIONES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1=[1 1 1 1];a2=[1 1 0 0];a3=[1 0 1 0];a4=[1 0 0 1];a5=[0 1 1 0];a6=[0 1 0 1];
a7=[0 0 1 1];a8=[1 1 1 0];a9=[1 0 1 1];a10=[1 1 0 1];a11=[0 1 1 1];a12=[1 0 0 0];
a13=[0 1 0 0];a14=[0 0 1 0];a15=[0 0 0 1];
%%%%%%%%%%%%%%%CREACION DE VECTORES ALEATORIOS PARA SEÑALES%%%%%%%%%%%%%%%%
y=rand(1,100);
yh=y;
yhh=yh;
yhhh=yhh;
if Res==a1 
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   figure,subplot(4,1,1),plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
   subplot(4,1,2),plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
   subplot(4,1,3),plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')
   subplot(4,1,4),plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end
if Res==a2 
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   figure,subplot(2,1,1),plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
   subplot(2,1,2),plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
end
if Res==a3 
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   figure,subplot(2,1,1),plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
   subplot(2,1,2),plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')
end
if Res==a4 
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(2,1,1),plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
   subplot(2,1,2),plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end
if Res==a5
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   figure,subplot(2,1,1),plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
   subplot(2,1,2),plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')
end
if Res==a6
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(2,1,1),plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
   subplot(2,1,2),plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end
if Res==a7
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(2,1,1),plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')
   subplot(2,1,2),plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end
if Res==a8
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   figure,subplot(3,1,1),plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
   subplot(3,1,2),plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
   subplot(3,1,3),plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')
end
if Res==a9
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(3,1,1),plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
   subplot(3,1,2),plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')
   subplot(3,1,3),plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end
if Res==a10
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(3,1,1),plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
   subplot(3,1,2),plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
   subplot(3,1,3),plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end
if Res==a11
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,subplot(3,1,1),plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
   subplot(3,1,2),plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')
   subplot(3,1,3),plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end
if Res==a12
   [yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
   figure,plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
end
if Res==a13
   [yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
   figure,plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
   end
if Res==a14
   [yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
   figure,plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')   
end
if Res==a15
   [yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
   figure,plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end
