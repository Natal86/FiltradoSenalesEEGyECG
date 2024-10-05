%%%SUMA DE SEÑALES SINUSOIDALES PURAS PARA EL ANALISIS DE FILTROS Y DEMAS%%
%%%%%%  T=1;    %%%%Tiempo de duración de la señal
%%%%%%  Fs=600; %%%%Frecuencia de muestreo de la señal
function[y]=SumaSinusoidal(T,Fs)
sen=input('Ingrese numero de señales a construir como CL de sinusoidales')
 for j=1:sen
      num=input('Ingrese numero de señales a sumar');       
      for i=1:num
          tono(i,1)=input('Ingrese el tono de cada señal sinusoidal');
      end
      for i=1:num
          am(i,1)=input('Ingrese amplitud de cada señal sinusoidal');
      end
      Ts=1/Fs;     %%Periodo de muestreo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      t=0:Ts:T;    %%Determinación de la duración de la señal en segundos%%%%%%%%
      for i=1:num
      y(i,:)=am(i,1)*sin(2*pi*tono(i,1)*t);
      end
      if num~=1
      Y(j,:)=sum(y);
      end
      if num==1
      Y(j,:)=y;
      end
      y=Y;
 end
if sen==1
figure,plot(y),title('Señal 1 como combinación lineal de tonos senoidales puros')
end
if sen>1
figure,subplot(2,1,1),plot(y(1,:)),title('Señal 1 como combinación lineal de tonos senoidales puros')
subplot(2,1,2),plot(y(2,:)),title('Señal 2 como combinación lineal de tonos senoidales puros')
end
