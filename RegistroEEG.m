%%[Sen]=RegistroEEG()
function [x Sen EEGESP ECGCEN]=RegistroEEG();
EEG=xlsread('EEG.xlsx');   %%%REGISTRO DEL ELECTROCARDIOGRAMA%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%SEÑALES EEG PRIMARIAS SIN MODIFICACIONES%%%%%%%%%%%%%
%figure,plot(EEG');
%%%%%%%%%FILTRADO DEL NUMERO DE SEÑALES QUE SE REQUIERE ESTUDIAR%%%%%%%%%%%
nu=input('Ingrese 1 para visualizar todos los canales o 2 para visualizar solo alguno/s');
int=input('Ingrese 1 para visualizar todo el registro o 2 para visualizar venana temporal');
%%%%CREACION DE LAS CUATRO POSIBLES MATRICES A ESCOJER POR EL USUARIO%%%%%%
if nu==1 && int==1
   EEG=EEG;
   ECG=ECG;
   %figure,plot(EEG');
   %%%%%%%%%%%%%%%%%5CENTRADO DE LAS SEÑALES SELECCIONADAS%%%%%%%%%%%%%%%%%
   [X,Y]=size(EEG);
   %%%%%%%%%%%%%%%%CENTRADO DE CADA UNA DE LAS SEÑALES EEG DEL REGISTRO%%%%
   for i=1:X
       med=mean(EEG(i,:));
         if med<0
            EEGCEN(i,:)=EEG(i,:)-med;
         end
         if med>0
            EEGCEN(i,:)=EEG(i,:)-med;
         end
   end
   %%%%%%%%%%%%%%%%%%%%%%%%%%PARA EL CASO DEL EGC%%%%%%%%%%%%%%%%%%%%%%%%%%
   med1=mean(ECG(1,:));
   if med1<0
            ECGCEN(1,:)=ECG(1,:)-med1;
   end
   if med1>0
            ECGCEN(1,:)=ECG(1,:)-med1;
   end
   %%%%%%%%%%%%%%%%%%%%%%%%%%OLGA OGA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   SenMax=max(max(EEGCEN))+100;
   [M,N]=size(EEGCEN);
   p=0;
   for i=1:M
       espa(i,1)=SenMax*p;
       p=i;
   end
   for i=1:M
       EEGESP(i,:)=EEGCEN(i,:)+espa(i,1);      
   end
   [b,g]=size(EEG);
   x=1:1:g;
   %figure,plot(x,EEGESP'),title('EEG Centradas y espaciadas')
end
if nu==1 && int==2
   int1=input('Ingrese inicio de ventana temporal del registro') 
   int2=input('Ingrese final de ventana temporal del registro')
   EEG=EEG(:,int1:int2);
   ECG=ECG(:,int1:int2);
   [b,g]=size(EEG);
   dis=g/(int2-int1);
   x=int1:dis:int2+1;
   %figure,plot(x,EEG');
   [X,Y]=size(EEG);
   %%%%%%%%%%%%%%%%CENTRADO DE CADA UNA DE LAS SEÑALES EEG DEL REGISTRO%%%%%%%
   for i=1:X
       med=mean(EEG(i,:));
         if med<0
            EEGCEN(i,:)=EEG(i,:)-med;
         end
         if med>0
            EEGCEN(i,:)=EEG(i,:)-med;
         end
   end
   %%%%%%%%%%%%%%%%%%%%%%%%%%PARA EL CASO DEL EGC%%%%%%%%%%%%%%%%%%%%%%%%%%
   med1=mean(ECG(1,:));
   if med1<0
            ECGCEN(1,:)=ECG(1,:)-med1;
   end
   if med1>0
            ECGCEN(1,:)=ECG(1,:)-med1;
   end
   %%%%%%%%%%%%%%%%%%%%%%ESPACIADO PARA LAS SEÑALES EEG%%%%%%%%%%%%%%%%%%%%
   SenMax=max(max(EEGCEN))+100;
   [M,N]=size(EEGCEN);
   p=0;
   for i=1:M
       espa(i,1)=SenMax*p;
       p=i;
   end
   for i=1:M
       EEGESP(i,:)=EEGCEN(i,:)+espa(i,1);      
   end
   %figure,plot(x,EEGESP'),title('EEG Centradas y espaciadas')
end
if nu==2 && int==1
   nume=input('Ingresar los canales deseados entre corchetes'); 
   [MM,NN]=size(EEG);
   [M,N]=size(nume);
   MA=zeros(MM,NN);
   for j=1:N
      for i=1:MM
         if i==j
             MA(i,:)=EEG(i,:);
         end       
      end
   end
   MA=MA(1:N,:);
   %figure,plot(MA');
   EEG=MA;
   [X,Y]=size(EEG);
   %%%%%%%%%%%%%%%%CENTRADO DE CADA UNA DE LAS SEÑALES EEG DEL REGISTRO%%%%%%%
   EEGCEN=zeros(X,Y);
   for i=1:X
       med=mean(EEG(i,:));
         if med<0
            EEGCEN(i,:)=EEG(i,:)-med;
         end
         if med>0
            EEGCEN(i,:)=EEG(i,:)-med;
         end
   end
   SenMax=max(max(EEGCEN))+100;
   [M,N]=size(EEGCEN);
   p=0;
   for i=1:M
       espa(i,1)=SenMax*p;
       p=i;
   end
   for i=1:M
       EEGESP(i,:)=EEGCEN(i,:)+espa(i,1);      
   end
   [b,g]=size(EEGCEN);
   x=1:1:g;
   %figure,plot(x,EEGESP'),title('EEG Centradas y espaciadas')
end
if nu==2 && int==2
   nume=input('Ingresar los canales deseados entre corchetes');
   int1=input('Ingrese inicio de ventana teporal del registro'); 
   int2=input('Ingrese final de ventana teporal del registro');
   [MM,NN]=size(EEG);
   [M,N]=size(nume);
   MA=zeros(MM,NN);
   for j=1:N
      for i=1:MM
         if i==j
             MA(i,:)=EEG(i,:);
         end       
      end
   end
   MA=MA(1:N,:);
   MA=MA(:,int1:int2);
   [b,g]=size(MA);
   dis=g/(int2-int1);
   x=int1:dis:int2+1;
   %%%figure,plot(x,MA'); %%%bien
   EEG=MA;
   [X,Y]=size(EEG);
   %%%%%%%%%%%%%%%%CENTRADO DE CADA UNA DE LAS SEÑALES EEG DEL REGISTRO%%%%%%%
   EEGCEN=zeros(X,Y);
   for i=1:X
       med=mean(EEG(i,:));
         if med<0
            EEGCEN(i,:)=EEG(i,:)-med;
         end
         if med>0
            EEGCEN(i,:)=EEG(i,:)-med;
         end
   end
   SenMax=max(max(EEGCEN))+100;
   [M,N]=size(EEGCEN);
   p=0;
   for i=1:M
       espa(i,1)=SenMax*p;
       p=i;
   end
   for i=1:M
       EEGESP(i,:)=EEGCEN(i,:)+espa(i,1);      
   end
   %figure,plot(x,EEGESP'),title('EEG Centradas y espaciadas')
end
Sen=EEGCEN;
end







% % % % Sen=xlsread('EEG.xlsx');
% % % % Sen=Sen';
% % % % SenMax=max(max(Sen))+100;
% % % % [M,N]=size(Sen);
% % % % p=0;
% % % % for i=1:M
% % % %     espa(i,1)=SenMax*p;
% % % %     p=i;
% % % % end
% % % % for i=1:M
% % % %     EEG(i,:)=Sen(i,:)+espa(i,1);      
% % % % end
% % % % nu=input('Ingrese 1 para visualizar todos los canales o 2 para visualizar solo alguno/s')
% % % % int=input('Ingrese 1 para ver todo el registro o 2 para ver ventana de tiempo del registro')
% % % % %%%%%%%%%%%%%%%%%%%%%POSIBILIDADES DE VISUALIZACIÓN%%%%%%%%%%%%%%%%%%%%%%%%
% % % % if nu==1 && int==1
% % % % figure,plot(EEG'),title('Señales EEG'),xlabel('Muestras por segundo'),ylabel('Amplitud')
% % % % end
% % % % if nu==1 && int==2
% % % %     int1=input('Ingrese inicio de ventana temporal para las señales')
% % % %     int2=input('Ingrese fin de la ventada temporal para las señales')
% % % %     EEG=EEG(:,int1:int2);   
% % % %     figure,plot(EEG'),title('Señales EEG'),xlabel('Muestras por segundo'),ylabel('Amplitud')
% % % % end
% % % % if nu==2 && int==1
% % % %    nume=input('Ingresar los canales deseados entre corchetes');
% % % %    [MM,NN]=size(EEG);
% % % %    [M,N]=size(nume);
% % % %    MA=zeros(MM,NN);
% % % %    for j=1:N
% % % %      for i=1:MM
% % % %         if i==j
% % % %            MA(i,:)=EEG(i,:);
% % % %         end       
% % % %      end
% % % %    end
% % % %    figure,plot(MA')
% % % % end