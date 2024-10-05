%%%%%%%%%FUNCION PARA CALCULAR EL ICA DE CUALQUIER OPCION DE SEÑALES%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%ELIMINACIÓN DE ARTEFACTOS EN SERIE ECG Y EOG%%%%%%%%%%%%%%%%
% % clc
% % clear all
% % close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Y]=MetodICA(T,Fs,Res,S)
a1=[1 0 0 0 0];a2=[0 1 0 0 0];a3=[0 0 1 0 0];a4=[0 0 0 1 0];a5=[0 0 0 0 1];
if Res==a4
   [Y1 Y2]=ICAEEGG(); 
end
if Res==a1
   for i=1:2
       me(i,:)=input('Ingrese media de la señal');
   end
   for i=1:2
       S(i,:)=S(i,:)+me(i,:);
   end
   [M,N]=size(S);
   w=rand(M);
   x=w*S;                    
   [Vec,Va]=eig(cov(x'));       
   v=(Vec*Va^(-0.5)*Vec')*x;
   z=repmat(sqrt(sum(v.^2)),M,1).*v;
   [Vecc,Vaa]=eig(cov(z'));
   Y=Vecc'*v;
%%%%%%%%%%%%DEVORVER A LA MEDIA CERO A LA SEÑAL DECORRELADA%%%%%%%%%%%%%%%%
   mm=mean(Y(2,:));
   if mm<0
   Y(2,:)=Y(2,:)+abs(mm);
   end
   if mm>0
      Y(2,:)=Y(2,:)-abs(mm); 
   end
%%%%%%%%%%%%%%%%%%%PRESENTACIÓN GRÁFICA DEL RESULTADO%%%%%%%%%%%%%%%%%%%%%%
   figure,subplot(3,2,1),plot(S(1,:)),title('Señal sensada 1');
   subplot(3,2,2),plot(S(2,:)),title('Señal sensada 2');
   subplot(3,2,3),plot(x(1,:)),title('Señal mezclada 2');
   subplot(3,2,4),plot(x(2,:)),title('Señal mezclada 2');
   subplot(3,2,5),plot(Y(1,:)),title('Señal demezclada 2');
   subplot(3,2,6),plot(Y(2,:)),title('Señal demazclada 2');
%%%%%%%%%%%%%%%%%%%%%%ESCUCHA DE LA SEÑAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   for i=1:M
       input('escuchar señal demezclada')
       sound(Y(i,:),Fs)
   end
end
if Res==a2
   for i=1:2
       me(i,:)=input('Ingrese media de la señal');
   end
   for i=1:2
       S(i,:)=S(i,:)+me(i,:);
   end
   [M,N]=size(S);
   w=rand(M);
   x=w*S;                    
   [Vec,Va]=eig(cov(x'));       
   v=(Vec*Va^(-0.5)*Vec')*x;
   z=repmat(sqrt(sum(v.^2)),M,1).*v;
   [Vecc,Vaa]=eig(cov(z'));
   Y=Vecc'*v;
%%%%%%%%%%%%DEVORVER A LA MEDIA CERO A LA SEÑAL DECORRELADA%%%%%%%%%%%%%%%%
   if me(1,:)==0
   mm=mean(Y(2,:));
   if mm<0
   Y(2,:)=Y(2,:)+abs(mm);
   end
   if mm>0
      Y(2,:)=Y(2,:)-abs(mm); 
   end
   end
   if me(2,:)==0
   mm=mean(Y(1,:));
   if mm<0
   Y(1,:)=Y(1,:)+abs(mm);
   end
   if mm>0
      Y(1,:)=Y(1,:)-abs(mm); 
   end
   end
%%%%%%%%%%%%%%%%%%%PRESENTACIÓN GRÁFICA DEL RESULTADO%%%%%%%%%%%%%%%%%%%%%%
   figure,subplot(3,2,1),plot(S(1,:)),title('Señal sensada 1');
   subplot(3,2,2),plot(S(2,:)),title('Señal sensada 2');
   subplot(3,2,3),plot(x(1,:)),title('Señal mezclada 2');
   subplot(3,2,4),plot(x(2,:)),title('Señal mezclada 2');
   subplot(3,2,5),plot(Y(1,:)),title('Señal demezclada 2');
   subplot(3,2,6),plot(Y(2,:)),title('Señal demazclada 2');
%%%%%%%%%%%%%%%%%%%%%%ESCUCHA DE LA SEÑAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
end
if Res==a3
   for i=1:2
       me(i,:)=input('Ingrese media de la señal');
   end
   for i=1:2
       S(i,:)=S(i,:)+me(i,:);
   end
   [M,N]=size(S);
   w=rand(M);
   x=w*S;                    
   [Vec,Va]=eig(cov(x'));       
   v=(Vec*Va^(-0.5)*Vec')*x;
   z=repmat(sqrt(sum(v.^2)),M,1).*v;
   [Vecc,Vaa]=eig(cov(z'));
   Y=Vecc'*v;
%%%%%%%%%%%%DEVORVER A LA MEDIA CERO A LA SEÑAL DECORRELADA%%%%%%%%%%%%%%%%
   mm=mean(Y(2,:));
   if mm<0
   Y(2,:)=Y(2,:)+abs(mm);
   end
   if mm>0
      Y(2,:)=Y(2,:)-abs(mm); 
   end
%%%%%%%%%%%%%%%%%%%PRESENTACIÓN GRÁFICA DEL RESULTADO%%%%%%%%%%%%%%%%%%%%%%
   figure,subplot(3,2,1),plot(S(1,:)),title('Señal sensada 1');
   subplot(3,2,2),plot(S(2,:)),title('Señal sensada 2');
   subplot(3,2,3),plot(x(1,:)),title('Señal mezclada 2');
   subplot(3,2,4),plot(x(2,:)),title('Señal mezclada 2');
   subplot(3,2,5),plot(Y(1,:)),title('Señal demezclada 2');
   subplot(3,2,6),plot(Y(2,:)),title('Señal demazclada 2');
%%%%%%%%%%%%%%%%%%%%%%ESCUCHA DE LA SEÑAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
if Res==a5
   for i=1:2
       me(i,:)=input('Ingrese media de la señal');
   end
   for i=1:2
       S(i,:)=S(i,:)+me(i,:);
   end
   [M,N]=size(S);
   w=rand(M);
   x=w*S;                    
   [Vec,Va]=eig(cov(x'));       
   v=(Vec*Va^(-0.5)*Vec')*x;
   z=repmat(sqrt(sum(v.^2)),M,1).*v;
   [Vecc,Vaa]=eig(cov(z'));
   Y=Vecc'*v;
%%%%%%%%%%%%DEVORVER A LA MEDIA CERO A LA SEÑAL DECORRELADA%%%%%%%%%%%%%%%%
   mm=mean(Y(2,:));
   if mm<0
   Y(2,:)=Y(2,:)+abs(mm);
   end
   if mm>0
      Y(2,:)=Y(2,:)-abs(mm); 
   end
%%%%%%%%%%%%%%%%%%%PRESENTACIÓN GRÁFICA DEL RESULTADO%%%%%%%%%%%%%%%%%%%%%%
   figure,subplot(3,2,1),plot(S(1,:)),title('Señal sensada 1');
   subplot(3,2,2),plot(S(2,:)),title('Señal sensada 2');
   subplot(3,2,3),plot(x(1,:)),title('Señal mezclada 2');
   subplot(3,2,4),plot(x(2,:)),title('Señal mezclada 2');
   subplot(3,2,5),plot(Y(1,:)),title('Señal demezclada 2');
   subplot(3,2,6),plot(Y(2,:)),title('Señal demazclada 2');
%%%%%%%%%%%%%%%%%%%%%%ESCUCHA DE LA SEÑAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ENTRADAS DEL USUARIO%%%%%%%%%%%%%%%%%%%%%%%%%
% % % art=input('Ingrese 1 para filtrar ECG 2 para filtrar ECG Y EOG');
% % % if art==2
% % % nume=input('Ingresar los canales de los electrodos FP1 ó FP2 para el EOG');
% % % end
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % EEG=xlsread('EEG.xlsx');   %%%REGISTRO DEL ENCEFALOGRAMA%%%%%%%%%%%%%%%%%%%
% % % ECG=xlsread('ECG.xlsx');   %%%REGISTRO DEL ELECTROCARDIOGRAMA%%%%%%%%%%%%%%
% % % EEG=EEG';
% % % ECG=ECG';
% % % %%%%%%%%%IGUALCION DE LAS DIMENSIONES DE LOS DOS VECTORES DE ENTRADA%%%%%%%
% % % [M,N]=size(EEG);
% % % [MM,NN]=size(ECG);
% % % if N<NN
% % %    ECG=ECG(1,1:N);
% % %  else
% % %    EEG=EEG(:,1:NN);
% % % end
% % % %%%%%%%%%%%%%%%%%%%COGIDO DEL ICA PARA LA ELIMINACIÓN DE ARTEFACTOS%%%%%%%%
% % % if art==1
% % %     s1=ECG;
% % %     [U,T]=size(EEG);
% % %     for i=1:U
% % %        s2=EEG(i,:);
% % %        Resultat=[s1;s2];
% % %        s=Resultat;
% % %        [E,R]=size(s);
% % %        w=rand(E);
% % %        x=w*s;                    %%%vector x de las señales en las fuentes%%%%%%%%
% % %        [n,m]=size(x);            %%%Numero de filas del vector de señales fuente%%
% % %        [Vec,Va]=eig(cov(x'));   %%%Autovalores y autovectores de la matriz MaCo%%
% % %        vdiag=Vec*Va^(-0.5)*Vec'; %%%Descomposicón en autovalores de la matri  MaCo
% % %        v=vdiag*x;    %%Multipicacion de la matriz de diagonalizacion por el x%%%%%
% % %        z=repmat(sqrt(sum(v.^2)),n,1).*v;
% % %        [Vecc,Vaa]=eig(cov(z'));
% % %        y=Vecc'*v; %%%%componentes principales
% % %        ww=Vecc'; 
% % %        Y1(i,:)=y(1,:); %%%%SEÑALES SEPARADAS DEL EEG
% % %        Y2(i,:)=y(2,:); %%%%SEÑALES SEPARADAS DEL ECG
% % %     end
% % % %%%%%%%%%PROCESO DE VISUALIZACIÓN DEL RESULTADO (ELIINACIÓN DEL ECG)%%%%%%%
% % % p=0;
% % % SenMax=max(max(Y1));
% % % SeMax=max(max(EEG));
% % % M=13
% % %    for i=1:M
% % %        espa(i,1)=SenMax*p;
% % %        espa1(i,1)=SeMax*p;
% % %        p=i;
% % %    end
% % %    for i=1:12
% % %        EEG(i,:)=EEG(i,:)+espa1(i,1);
% % %        EEGF1(i,:)=Y1(i,:)+espa(i,1); 
% % %        EEGF2(i,:)=Y2(i,:)+espa(i,1); 
% % %    end
% % % figure,plot(EEG'),title('Señal sin Filtrar'); 
% % % figure,plot(-EEGF1'),title('Señal Filtrada del EEG'); 
% % % figure,plot(-EEGF2'),title('Señal Filtrada del artefacto'); 
% % % end  
% % % %%%%%%%%%%%%%%%OPCION PARA FILTRAR EL ECG Y EL EOG%%%%%%%%%%%%%%%%%%%%%%%%%
% % % if art==2
% % % %%%%%%SEPARACION DE LOS CANALES FP1 Ó FP2 O EOG DE LOS REGISTROS EEG%%%%%%%
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %   EOG=EEG(nume,:); 
% % % %%%%%%%%%%%%%%%CENTRADO DE LAS SEÑALES DE LOS ARTEFACTOS%%%%%%%%%%%%%%%%%%%
% % % %%%%%%%%SUSTRACCIÓN DE LAS DOS SEÑALES FP1 YFP2 DEL REGISTRO EEG%%%%%%%%%%%
% % %   EEGSIN=EEG;
% % %   for i=1:M
% % %      if nume==i
% % %         EEGSIN(i,:)=[];       %%%%EEG SIN LOS DOS CANALES FP1 Y FP2%%%%%%%%
% % %      end
% % %   end
% % %     Resultat=[ECG;EOG];
% % %     ART=Resultat;
% % % % % figure,imagesc(EEG),title('Canales completos del registro EEG');
% % % % % figure,imagesc(EEGSIN),title('Canales del EEG sin el canal de referencia para el EOG');
% % %  for j=1:2 
% % %    s1=ART(j,:); 
% % %    [U,T]=size(EEGSIN);
% % %    for i=1:U
% % %        s2=EEGSIN(i,:);
% % %        Resultat=[s1;s2];
% % %        s=Resultat;
% % %        [E,R]=size(s);
% % %        w=rand(E);
% % %        x=w*s;                    %%%vector x de las señales en las fuentes%%%%%%%%
% % %        [n,m]=size(x);            %%%Numero de filas del vector de señales fuente%%
% % %        [Vec,Va]=eig(cov(x'));   %%%Autovalores y autovectores de la matriz MaCo%%
% % %        vdiag=Vec*Va^(-0.5)*Vec'; %%%Descomposicón en autovalores de la matri  MaCo
% % %        v=vdiag*x;    %%Multipicacion de la matriz de diagonalizacion por el x%%%%%
% % %        z=repmat(sqrt(sum(v.^2)),n,1).*v;
% % %        [Vecc,Vaa]=eig(cov(z'));
% % %        y=Vecc'*v; %%%%componentes principales
% % %        ww=Vecc'; 
% % %        Y1(i,:)=y(1,:); %%%%SEÑALES SEPARADAS DEL EEG
% % %        Y2(i,:)=y(2,:); %%%%SEÑALES SEPARADAS DEL ECG
% % %    end
% % %  end
% % %    p=0;
% % %    SenMax=max(max(Y1));
% % %    SeMax=max(max(EEG));
% % %    [M,N]=size(EEGSIN);
% % %    for i=1:M
% % %        espa(i,1)=SenMax*p;
% % %        espa1(i,1)=SeMax*p;
% % %        p=i;
% % %    end
% % %    for i=1:12
% % %        EEG(i,:)=EEG(i,:)+espa1(i,1);
% % %        EEGF1(i,:)=Y1(i,:)+espa(i,1); 
% % %        EEGF2(i,:)=Y2(i,:)+espa(i,1); 
% % %    end
% % % figure,plot(EEG'),title('Señal sin Filtrar'); 
% % % figure,plot(-EEGF1'),title('Señal Filtrada del EEG'); 
% % % figure,plot(-EEGF2'),title('Señal Filtrada del artefacto'); 
%%%%%end
