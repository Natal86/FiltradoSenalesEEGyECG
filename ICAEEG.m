% % % %%%%%%%%%%%%%%%ELIMINACIÓN DE ARTEFACTOS EN SERIE ECG Y EOG%%%%%%%%%%%%%%%%
% % % clc
% % % clear all
% % % close all
function [Y1 Y2]=ICAEEG()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EEG=xlsread('EEG.xlsx');   %%%REGISTRO DEL ENCEFALOGRAMA%%%%%%%%%%%%%%%%%%%
ECG=xlsread('ECG.xlsx');   %%%REGISTRO DEL ELECTROCARDIOGRAMA%%%%%%%%%%%%%%
EEG=EEG';
ECG=ECG';
%%%%%%%%%IGUALCION DE LAS DIMENSIONES DE LOS DOS VECTORES DE ENTRADA%%%%%%%
[M,N]=size(EEG);
[MM,NN]=size(ECG);
if N<NN
   ECG=ECG(1,1:N);
 else
   EEG=EEG(:,1:NN);
end
%%%%%%SEPARACION DE LOS CANALES FP1 Y FP2 O ECG DE LOS REGISTROS EEG%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
op=input('1 para filtat ECG y 2 para filtrar EOG 3 para filtrar ambos');
%nume=input('Ingresar el canal de referencia para el EOG');
nume=9; %%%ó 14 tambien puede ser
EOG=EEG(nume,:);   %%%LAS DOS SEÑALES DE FP1 Y FP2%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%CENTRADO DE LAS SEÑALES DE LOS ARTEFACTOS%%%%%%%%%%%%%%%%%%%
%%%%%%%%SUSTRACCIÓN DE LAS DOS SEÑALES FP1 YFP2 DEL REGISTRO EEG%%%%%%%%%%%
[E,D]=size(EEG);
EEGSIN=EEG;
  for i=1:E
     if i==nume
        EEGSIN(i,:)=[];       %%%%EEG SIN LOS DOS CANALES FP1 Y FP2%%%%%%%%
     end
  end
% % figure,imagesc(EEG)
% % figure,imagesc(EEGSIN)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%MATRIZ DE TODAS LAS SEÑALES ORDENADAS 1)ECG 2)EOC 3)EEG%%%%%%%%%%%%
Resultat=[ECG;EOG;EEGSIN];
%%%%%%%%%%%%%%%%%%%%%%%%CENTRADO DE TODAS LAS SEÑALES%%%%%%%%%%%%%%%%%%%%%%
SEN=Resultat;
[X,Y]=size(SEN);
SENCEN=zeros(X,Y);
   for i=1:X
       med=mean(SEN(i,:));
         if med<0
            SENCEN(i,:)=SEN(i,:)-med;
         end
         if med>0
            SENCEN(i,:)=SEN(i,:)-med;
         end
   end
[U,T]=size(SENCEN);
%%figure,plot(SENCEN'); %%%NO MODIFICA LA SEÑÑAL%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%PROGRAMA DEL ICA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if op==1
  s1=SENCEN(1,:)+20;   %%%SEÑAL DEL ECG
else                
    s1=SENCEN(2,:); %%%SEÑAL DEL EOG
end  
SENCENSIN=SENCEN(3:15,:);
[U,V]=size(SENCENSIN);
for i=1:U
    s2=SENCENSIN(i,:);
    Resultat=[s1;s2];
    s=Resultat;
    [E,R]=size(s);
    w=rand(E);
    x=w*s;                   %%%vector x de las señales en las fuentes%%%%%
    [Vec,Va]=eig(cov(x'));   %%%Autovalores y autovectores de  matriz MaCo%
    vdiag=Vec*Va^(-0.5)*Vec';%%%Descomposicón en autovalores de matri  MaCo
    v=vdiag*x;    %%Multipicacion de la matriz de diagonalizacion por el x%
    z=repmat(sqrt(sum(v.^2)),E,1).*v;
    [Vecc,Vaa]=eig(cov(z'));
    y=Vecc'*v; %%%%componentes principales
    Y1(i,:)=y(1,:); %%%%SEÑALES SEPARADAS DEL EEG
    Y2(i,:)=y(2,:); %%%%SEÑALES SEPARADAS DEL ECG
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SENCEN(1,:)=SENCEN(1,:)+20;
SENCENSIN=SENCEN(3:15,:)+20;
[U,V]=size(SENCENSIN);
if op==3
  for k=1:2   
    s1(k,:)=SENCEN(k,:);
    for i=1:U
        s2=SENCENSIN(i,:);
        Resultat=[s1;s2];
        s=Resultat;
        [E,R]=size(s);
        w=rand(E);
        x=w*s;                   %%%vector x de las señales en las fuentes%%%%%
        [Vec,Va]=eig(cov(x'));   %%%Autovalores y autovectores de  matriz MaCo%
        vdiag=Vec*Va^(-0.5)*Vec';%%%Descomposicón en autovalores de matri  MaCo
        v=vdiag*x;    %%Multipicacion de la matriz de diagonalizacion por el x%
        z=repmat(sqrt(sum(v.^2)),E,1).*v;
        [Vecc,Vaa]=eig(cov(z'));
        y=Vecc'*v; %%%%componentes principales
        Y1(i,:)=y(1,:); %%%%SEÑALES SEPARADAS DEL EEG (EEG SIN EL ARTEFACTO)
        Y2(i,:)=y(2,:); %%%%SEÑALES SEPARADAS DEL ECG (AREFACTO SIN EEG)
    end
        SENCENSIN=Y1;
  end
  Y1=SENCENSIN;
end
%%%%%%%%%%%%%%%%%%%%PROCESO DE REPRESENTACION GRAFICA DE LOS DATOS%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p=0;
SENCENSIN=SENCEN(3:15,:);
[M,N]=size(SENCENSIN);
SenMax1=max(max(Y1))+10;
SenMax2=max(max(Y2))+10;
SeMax=max(max(SENCENSIN))+10;
   for i=1:M
       espa1(i,1)=SenMax1*p;
       espa2(i,1)=SenMax2*p;
       espa(i,1)=SeMax*p;
       p=i;
   end
   for i=1:M
       EEGCEN(i,:)=SENCENSIN(i,:)+espa(i,1);
       EEGF1(i,:)=Y1(i,:)+espa1(i,1); 
       EEGF2(i,:)=Y2(i,:)+espa2(i,1); 
   end
if op==1   
figure,plot(EEGCEN'),title('Señal del registro EEG sin Filtrar '); 
figure,plot(EEGF1'),title('Señal Filtrada (Se extrajo el EEG del ECG)'); 
figure,plot(EEGF2'),title('Señal Filtrada (Se extrajo el ECG del EEG)');
end
if op==2   
figure,plot(EEGCEN'),title('Señal del registro EEG sin Filtrar '); 
figure,plot(EEGF1'),title('Señal Filtrada (Se extrajo el EEG del EOG)'); 
figure,plot(EEGF2'),title('Señal Filtrada (Se extrajo el EOG del EEG)');
end
if op==3   
figure,plot(EEGCEN'),title('Señal del registro EEG sin Filtrar '); 
figure,plot(EEGF1'),title('Señal Filtrada (Se extrajo el EEG del EOG y del ECG)'); 
figure,plot(EEGF2'),title('Señal Filtrada (Se extrajo el EOG y el ECG del EEG)');
end


