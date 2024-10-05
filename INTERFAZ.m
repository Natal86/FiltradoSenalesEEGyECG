function varargout = INTERFAZ(varargin)
% INTERFAZ MATLAB code for INTERFAZ.fig
%      INTERFAZ, by itself, creates a new INTERFAZ or raises the existing
%      singleton*.
%
%      H = INTERFAZ returns the handle to a new INTERFAZ or the handle to
%      the existing singleton*.
%
%      INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ.M with the given input arguments.
%
%      INTERFAZ('Property','Value',...) creates a new INTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before INTERFAZ_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to INTERFAZ_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help INTERFAZ

% Last Modified by GUIDE v2.5 27-Jan-2017 12:22:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @INTERFAZ_OpeningFcn, ...
                   'gui_OutputFcn',  @INTERFAZ_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before INTERFAZ is made visible.
function INTERFAZ_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to INTERFAZ (see VARARGIN)

% Choose default command line output for INTERFAZ
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes INTERFAZ wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = INTERFAZ_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
T=str2double(get(handles.T,'string'));       %%Duración de la Señal%%%%%%%%
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%%%
Wp1=str2double(get(handles.Wp1,'string'));   %%Amplitud de la señal%%%%%%%%
Ws1=str2double(get(handles.Ws1,'string'));
Rppb=str2double(get(handles.Rppb,'string'));
Rspb=str2double(get(handles.Rspb,'string'));
W1p=str2double(get(handles.W1p,'string'));
W2p=str2double(get(handles.W2p,'string'));
W1s=str2double(get(handles.W1s,'string'));
W2s=str2double(get(handles.W2s,'string'));
Rp=str2double(get(handles.Rp,'string'));
Rs=str2double(get(handles.Rs,'string'));
Wp1p=str2double(get(handles.Wp1p,'string'));
Wp2p=str2double(get(handles.Wp2p,'string'));
Ws1s=str2double(get(handles.Ws1s,'string'));
Ws2s=str2double(get(handles.Ws2s,'string'));
Rpp2=str2double(get(handles.Rpp2,'string'));
Rss2=str2double(get(handles.Rss2,'string'));
Rspb=str2double(get(handles.Rspb,'string'));   %%Amplitud de la señal%%%%%%
Wppa=str2double(get(handles.Wppa,'string'));   %%Duración de la Señal%%%%%%
Wspa=str2double(get(handles.Wspa,'string'));   %%Frecuencia de muestreo%%%%
Rppa=str2double(get(handles.Rppa,'string'));   %%Amplitud de la señal%%%%%%
Rspa=str2double(get(handles.Rspa,'string'));   %%Amplitud de la señal%%%%%%
estado5=get(handles.checkbox5,'Value');
estado6=get(handles.checkbox6,'Value');
estado7=get(handles.checkbox7,'Value');
estado8=get(handles.checkbox8,'Value');
if estado5==1
   op5=1; 
   else
   op5=0;
end
if estado6==1
   op6=1; 
   else
   op6=0;
end
if estado7==1
   op7=1; 
   else
   op7=0;
end
if estado8==1
   op8=1; 
   else
   op8=0;
end
Resultat=[op5 op6 op7 op8];
Res=Resultat;
Fss=Fs;
Fsss=Fss;
Fssss=Fsss;
[a1]=DiagramasBode(Wppa,Wspa,Rppa,Rspa,Res,Fs,Fss,Fsss,Fssss,Wp1,Ws1,Rppb,Rspb,W1p,W2p,W1s,W2s,Rp,Rs,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox1
T=str2double(get(handles.T,'string'));       %%Duración de la Señal%%%%%%%%
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%%%
Am=str2double(get(handles.Am,'string'));     %%Amplitud de la señal%%%%%%%%
if get(hObject,'Value')        %%%%%%%%%% Si el checkbox ha sido marcado
[xx sen]=SenalAcustic(T,Fs);
if sen==1
figure,,plot(xx),xlabel('Muestras de la Señal'),title('Señal grabada 1')
end
if sen==2
figure,subplot(2,1,1),plot(xx(:,1)),xlabel('Muestras de la Señal'),title('Señal grabada 1')
subplot(2,1,2),plot(xx(:,2)),xlabel('Muestras de la Señal'),title('Señal grabada 2');
end
xlswrite('Acust.xlsx',xx);
end 

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox2
T=str2double(get(handles.T,'string'));       %%Duración de la Señal%%%%%%%%
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%%%
Am=str2double(get(handles.Am,'string'));     %%Amplitud de la señal%%%%%%%%
Am=1;
if get(hObject,'Value')        %%%%%%%%%% Si el checkbox ha sido marcado
  [y]=SumaSinusoidal(T,Fs);
  y=y';
  xlswrite('Teo.xlsx',y);
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox3
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%%%
Am=str2double(get(handles.Am,'string'));     %%Amplitud de la señal%%%%%%%%
Am=1;
fs=Fs;
Ts=1/fs;
if get(hObject,'Value')   
[MA]=SecuenciaSenos(fs,Ts);
MA=MA';
xlswrite('Teo1.xlsx',MA);
end

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox4
Am=str2double(get(handles.Am,'string'));   
if get(hObject,'Value') 
[x Sen EEGESP ECGCEN]=RegistroEEG();
figure,plot(x,EEGESP'),title('EEG Centradas y espaciadas')
end

function Am_Callback(hObject, eventdata, handles)
% hObject    handle to Am (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Am as text
%        str2double(get(hObject,'String')) returns contents of Am as a double


% --- Executes during object creation, after setting all properties.
function Am_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Am (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T_Callback(hObject, eventdata, handles)
% hObject    handle to T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T as text
%        str2double(get(hObject,'String')) returns contents of T as a double


% --- Executes during object creation, after setting all properties.
function T_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fs_Callback(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fs as text
%        str2double(get(hObject,'String')) returns contents of Fs as a double


% --- Executes during object creation, after setting all properties.
function Fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox5
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%
Rspb=str2double(get(handles.Rspb,'string'));   %%Amplitud de la señal%%%%%%
Wp1=str2double(get(handles.Wp1,'string'));     %%Duración de la Señal%%%%%%
Ws1=str2double(get(handles.Ws1,'string'));     %%Frecuencia de muestreo%%%%
Rppb=str2double(get(handles.Rppb,'string'));   %%Amplitud de la señal%%%%%%
if get(hObject,'Value')
Fss=Fs;
y=rand(1,100); 
[yh,yfs1,yf1,a,b,H,W,NFFT,f]=PasoBajo(Fss,y,Wp1,Ws1,Rppb,Rspb);
%figure,plot(0.5*Fss.*W./pi,abs(H)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Bajo')
end
% --- Executes on button press in checkbox6.


function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox6
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%
Rspb=str2double(get(handles.Rspb,'string'));   %%Amplitud de la señal%%%%%%
Wppa=str2double(get(handles.Wppa,'string'));     %%Duración de la Señal%%%%%%
Wspa=str2double(get(handles.Wspa,'string'));     %%Frecuencia de muestreo%%%%
Rppa=str2double(get(handles.Rppa,'string'));   %%Amplitud de la señal%%%%%%
Rspa=str2double(get(handles.Rspa,'string'));   %%Amplitud de la señal%%%%%%
Fssss=Fs;
yhhh=rand(1,100);
if get(hObject,'Value')
[yhhhh,yfs4,yf4,HHHH,WWWW,NFFT,f]=PasoAlto(Fssss,yhhh,Wppa,Wspa,Rppa,Rspa);
%figure,plot(0.5*Fssss.*WWWW./pi,abs(HHHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Alto')
end

% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox7
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%
W1p=str2double(get(handles.W1p,'string'));     %%Duración de la Señal%%%%%%
W2p=str2double(get(handles.W2p,'string')); 
W1s=str2double(get(handles.W1s,'string'));     %%Frecuencia de muestreo%%%%
W2s=str2double(get(handles.W2s,'string')); 
Rp=str2double(get(handles.Rp,'string'));     %%Amplitud de la señal%%%%%%
Rs=str2double(get(handles.Rs,'string'));     %%Amplitud de la señal%%%%%%
if get(hObject,'Value')
Fsss=Fs;
yhh=rand(1,100);
[yhhh,yfs3,yf3,aaa,bbb,HHH,WWW,NFFT,f]=PasaBanda(Fsss,yhh,W1p,W2p,W1s,W2s,Rp,Rs);
%figure,plot(0.005*Fsss.*WWW./pi,abs(HHH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Pasa Banda')
end

% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox8
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%
Wp1p=str2double(get(handles.Wp1p,'string'));     %%Duración de la Señal%%%%%%
Wp2p=str2double(get(handles.Wp2p,'string')); 
Ws1s=str2double(get(handles.Ws1s,'string'));     %%Frecuencia de muestreo%%%%
Ws2s=str2double(get(handles.Ws2s,'string')); 
Rpp2=str2double(get(handles.Rpp2,'string'));     %%Amplitud de la señal%%%%%%
Rss2=str2double(get(handles.Rss2,'string'));     %%Amplitud de la señal%%%%%%
Fssss=Fs;
if get(hObject,'Value')
fe=Fssss/2;           %%%%%Frecuencia de Nyquist%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yh=rand(1,100);
[yhh,yfs2,yf2,aa,bb,HH,WW,NFFT,f]=Notch(Fssss,yh,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2);
%figure,plot(0.005*Fs.*WW./pi,abs(HH)),xlabel('Frecuencia Hz'),ylabel('Modulo de H(z)'),title('Respuesta Filtro Notch')
end

function Wp1_Callback(hObject, eventdata, handles)
% hObject    handle to Wp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wp1 as text
%        str2double(get(hObject,'String')) returns contents of Wp1 as a double


% --- Executes during object creation, after setting all properties.
function Wp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ws1_Callback(hObject, eventdata, handles)
% hObject    handle to Ws1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ws1 as text
%        str2double(get(hObject,'String')) returns contents of Ws1 as a double


% --- Executes during object creation, after setting all properties.
function Ws1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ws1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rppb_Callback(hObject, eventdata, handles)
% hObject    handle to Rppb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rppb as text
%        str2double(get(hObject,'String')) returns contents of Rppb as a double


% --- Executes during object creation, after setting all properties.
function Rppb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rppb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rspb_Callback(hObject, eventdata, handles)
% hObject    handle to Rspb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rspb as text
%        str2double(get(hObject,'String')) returns contents of Rspb as a double


% --- Executes during object creation, after setting all properties.
function Rspb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rspb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wppa_Callback(hObject, eventdata, handles)
% hObject    handle to Wppa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wppa as text
%        str2double(get(hObject,'String')) returns contents of Wppa as a double


% --- Executes during object creation, after setting all properties.
function Wppa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wppa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wspa_Callback(hObject, eventdata, handles)
% hObject    handle to Wspa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wspa as text
%        str2double(get(hObject,'String')) returns contents of Wspa as a double


% --- Executes during object creation, after setting all properties.
function Wspa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wspa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rppa_Callback(hObject, eventdata, handles)
% hObject    handle to Rppa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rppa as text
%        str2double(get(hObject,'String')) returns contents of Rppa as a double


% --- Executes during object creation, after setting all properties.
function Rppa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rppa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rspa_Callback(hObject, eventdata, handles)
% hObject    handle to Rspa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rspa as text
%        str2double(get(hObject,'String')) returns contents of Rspa as a double


% --- Executes during object creation, after setting all properties.
function Rspa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rspa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function W1p_Callback(hObject, eventdata, handles)
% hObject    handle to W1p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of W1p as text
%        str2double(get(hObject,'String')) returns contents of W1p as a double


% --- Executes during object creation, after setting all properties.
function W1p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W1p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function W1s_Callback(hObject, eventdata, handles)
% hObject    handle to W1s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of W1s as text
%        str2double(get(hObject,'String')) returns contents of W1s as a double


% --- Executes during object creation, after setting all properties.
function W1s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W1s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rp_Callback(hObject, eventdata, handles)
% hObject    handle to Rp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rp as text
%        str2double(get(hObject,'String')) returns contents of Rp as a double


% --- Executes during object creation, after setting all properties.
function Rp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rs_Callback(hObject, eventdata, handles)
% hObject    handle to Rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rs as text
%        str2double(get(hObject,'String')) returns contents of Rs as a double


% --- Executes during object creation, after setting all properties.
function Rs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function W2p_Callback(hObject, eventdata, handles)
% hObject    handle to W2p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of W2p as text
%        str2double(get(hObject,'String')) returns contents of W2p as a double


% --- Executes during object creation, after setting all properties.
function W2p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W2p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function W2s_Callback(hObject, eventdata, handles)
% hObject    handle to W2s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of W2s as text
%        str2double(get(hObject,'String')) returns contents of W2s as a double


% --- Executes during object creation, after setting all properties.
function W2s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W2s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wp1p_Callback(hObject, eventdata, handles)
% hObject    handle to Wp1p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wp1p as text
%        str2double(get(hObject,'String')) returns contents of Wp1p as a double


% --- Executes during object creation, after setting all properties.
function Wp1p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wp1p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ws1s_Callback(hObject, eventdata, handles)
% hObject    handle to Ws1s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ws1s as text
%        str2double(get(hObject,'String')) returns contents of Ws1s as a double


% --- Executes during object creation, after setting all properties.
function Ws1s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ws1s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rpp2_Callback(hObject, eventdata, handles)
% hObject    handle to Rpp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rpp2 as text
%        str2double(get(hObject,'String')) returns contents of Rpp2 as a double


% --- Executes during object creation, after setting all properties.
function Rpp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rpp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rss2_Callback(hObject, eventdata, handles)
% hObject    handle to Rss2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rss2 as text
%        str2double(get(hObject,'String')) returns contents of Rss2 as a double


% --- Executes during object creation, after setting all properties.
function Rss2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rss2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wp2p_Callback(hObject, eventdata, handles)
% hObject    handle to Wp2p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wp2p as text
%        str2double(get(hObject,'String')) returns contents of Wp2p as a double


% --- Executes during object creation, after setting all properties.
function Wp2p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wp2p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ws2s_Callback(hObject, eventdata, handles)
% hObject    handle to Ws2s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ws2s as text
%        str2double(get(hObject,'String')) returns contents of Ws2s as a double


% --- Executes during object creation, after setting all properties.
function Ws2s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ws2s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
T=str2double(get(handles.T,'string'));       %%Duración de la Señal%%%%%%%%
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%%%
Wp1=str2double(get(handles.Wp1,'string'));     %%Amplitud de la señal%%%%%%%%
Ws1=str2double(get(handles.Ws1,'string'));
Rppb=str2double(get(handles.Rppb,'string'));
Rspb=str2double(get(handles.Rspb,'string'));
W1p=str2double(get(handles.W1p,'string'));
W2p=str2double(get(handles.W2p,'string'));
W1s=str2double(get(handles.W1s,'string'));
W2s=str2double(get(handles.W2s,'string'));
Rp=str2double(get(handles.Rp,'string'));
Rs=str2double(get(handles.Rs,'string'));
Wp1p=str2double(get(handles.Wp1p,'string'));
Wp2p=str2double(get(handles.Wp2p,'string'));
Ws1s=str2double(get(handles.Ws1s,'string'));
Ws2s=str2double(get(handles.Ws2s,'string'));
Rpp2=str2double(get(handles.Rpp2,'string'));
Rss2=str2double(get(handles.Rss2,'string'));
Rspb=str2double(get(handles.Rspb,'string'));   %%Amplitud de la señal%%%%%%
Wppa=str2double(get(handles.Wppa,'string'));   %%Duración de la Señal%%%%%%
Wspa=str2double(get(handles.Wspa,'string'));   %%Frecuencia de muestreo%%%%
Rppa=str2double(get(handles.Rppa,'string'));   %%Amplitud de la señal%%%%%%
Rspa=str2double(get(handles.Rspa,'string'));   %%Amplitud de la señal%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
estado1=get(handles.checkbox1,'Value');
estado2=get(handles.checkbox2,'Value');
estado3=get(handles.checkbox3,'Value');
estado4=get(handles.checkbox4,'Value');
if estado1==1
   op1=1; 
   else
   op1=0;
end
if estado2==1
   op2=1; 
   else
   op2=0;
end
if estado3==1
   op3=1; 
   else
   op3=0;
end
if estado4==1
   op4=1; 
   else
   op4=0;
end
Resultat=[op1 op2 op3 op4];
R=Resultat;
A=Resultat;
A(A==0)=[];
[E,Q]=size(A);
if Q~=1
   input('Favor escoger sólo una opcion de señal') 
   clear all
end
b1=[1 0 0 0]; b2=[0 1 0 0]; b3=[0 0 1 0]; b4=[0 0 0 1];
if R==b1
   y=xlsread('Acust.xlsx');
end
if R==b2
   y=xlsread('Teo.xlsx');
end
if R==b3
   y=xlsread('Teo1.xlsx');
end
if R==b4
   [x Sen EEGESP]=RegistroEEG();
   y=Sen;
% % %    y=xlsread('EEG.xlsx');  
% % %    y=y';
end
%%%%%%%%%%%%%%%%%%%%PARA LAS COMBINACIÓNES DE LOS FILTROS%%%%%%%%%%%%%%%%%%
estado5=get(handles.checkbox5,'Value');
estado6=get(handles.checkbox6,'Value');
estado7=get(handles.checkbox7,'Value');
estado8=get(handles.checkbox8,'Value');
if estado5==1
   op5=1; 
   else
   op5=0;
end
if estado6==1
   op6=1; 
   else
   op6=0;
end
if estado7==1
   op7=1; 
   else
   op7=0;
end
if estado8==1
   op8=1; 
   else
   op8=0;
end
Resultat=[op5 op6 op7 op8];
Res=Resultat;
Fss=Fs;
Fsss=Fss;
Fssss=Fsss;
%%%%%%%%%%%%%SELECCION DE SEÑALES EEG Y OPCIONES CONVENCIONALES%%%%%%%%%%%%
[M,N]=size(y);
% % if M>1
% %   [a1]=FSenalesEEG(Wppa,Wspa,Rppa,Rspa,Res,Fs,Fss,Fsss,Fssss,Wp1,Ws1,Rppb,Rspb,W1p,W2p,W1s,W2s,Rp,Rs,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2,y,x);
% % end
% % if M==1
  [a1]=Senales(Wppa,Wspa,Rppa,Rspa,Res,Fs,Fss,Fsss,Fssss,Wp1,Ws1,Rppb,Rspb,W1p,W2p,W1s,W2s,Rp,Rs,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2,y);
% % end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
T=str2double(get(handles.T,'string'));       %%Duración de la Señal%%%%%%%%
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%%%
Wp1=str2double(get(handles.Wp1,'string'));     %%Amplitud de la señal%%%%%%%%
Ws1=str2double(get(handles.Ws1,'string'));
Rppb=str2double(get(handles.Rppb,'string'));
Rspb=str2double(get(handles.Rspb,'string'));
W1p=str2double(get(handles.W1p,'string'));
W2p=str2double(get(handles.W2p,'string'));
W1s=str2double(get(handles.W1s,'string'));
W2s=str2double(get(handles.W2s,'string'));
Rp=str2double(get(handles.Rp,'string'));
Rs=str2double(get(handles.Rs,'string'));
Wp1p=str2double(get(handles.Wp1p,'string'));
Wp2p=str2double(get(handles.Wp2p,'string'));
Ws1s=str2double(get(handles.Ws1s,'string'));
Ws2s=str2double(get(handles.Ws2s,'string'));
Rpp2=str2double(get(handles.Rpp2,'string'));
Rss2=str2double(get(handles.Rss2,'string'));
Rspb=str2double(get(handles.Rspb,'string'));   %%Amplitud de la señal%%%%%%
Wppa=str2double(get(handles.Wppa,'string'));   %%Duración de la Señal%%%%%%
Wspa=str2double(get(handles.Wspa,'string'));   %%Frecuencia de muestreo%%%%
Rppa=str2double(get(handles.Rppa,'string'));   %%Amplitud de la señal%%%%%%
Rspa=str2double(get(handles.Rspa,'string'));   %%Amplitud de la señal%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
estado1=get(handles.checkbox1,'Value');
estado2=get(handles.checkbox2,'Value');
estado3=get(handles.checkbox3,'Value');
estado4=get(handles.checkbox4,'Value');
if estado1==1
   op1=1; 
   else
   op1=0;
end
if estado2==1
   op2=1; 
   else
   op2=0;
end
if estado3==1
   op3=1; 
   else
   op3=0;
end
if estado4==1
   op4=1; 
   else
   op4=0;
end
Resultat=[op1 op2 op3 op4];
R=Resultat;
A=Resultat;
A(A==0)=[];
[E,Q]=size(A);
if Q~=1
   input('Favor escoger sólo una opcion de señal') 
   clear all
end
b1=[1 0 0 0]; b2=[0 1 0 0]; b3=[0 0 1 0]; b4=[0 0 0 1];
if R==b1
   y=xlsread('Acust.xlsx');
end
if R==b2
   y=xlsread('Teo.xlsx');
end
if R==b3
   y=xlsread('Teo1.xlsx');
end
if R==b4
   y=xlsread('EEG.xlsx'); 
end
%%%%%%%%%%%%%%%%%%%%PARA LAS COMBINACIÓNES DE LOS FILTROS%%%%%%%%%%%%%%%%%%
estado5=get(handles.checkbox5,'Value');
estado6=get(handles.checkbox6,'Value');
estado7=get(handles.checkbox7,'Value');
estado8=get(handles.checkbox8,'Value');
if estado5==1
   op5=1; 
   else
   op5=0;
end
if estado6==1
   op6=1; 
   else
   op6=0;
end
if estado7==1
   op7=1; 
   else
   op7=0;
end
if estado8==1
   op8=1; 
   else
   op8=0;
end
Resultat=[op5 op6 op7 op8];
Res=Resultat;
Fss=Fs;
Fsss=Fss;
Fssss=Fsss;
[a1]=EspectroSenales(Wppa,Wspa,Rppa,Rspa,Res,Fs,Fss,Fsss,Fssss,Wp1,Ws1,Rppb,Rspb,W1p,W2p,W1s,W2s,Rp,Rs,Wp1p,Wp2p,Ws1s,Ws2s,Rpp2,Rss2,y);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
T=str2double(get(handles.T,'string'));       %%Duración de la Señal%%%%%%%%
Fs=str2double(get(handles.Fs,'string'));     %%Frecuencia de muestreo%%%%%%
Am=str2double(get(handles.Am,'string'));     %%Amplitud de la señal%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
estado1=get(handles.checkbox1,'Value');
estado2=get(handles.checkbox2,'Value');
estado3=get(handles.checkbox3,'Value');
estado4=get(handles.checkbox4,'Value');
estado9=get(handles.checkbox9,'Value');
input('cargar datos');
if estado1==1
   op1=1;
   S=xlsread('Acust.xlsx');
   S=S';
   else
   op1=0;
end
if estado2==1
   op2=1;
   S=xlsread('Teo.xlsx');
   S=S';
   else
   op2=0;
end
if estado3==1
   op3=1; 
   S=xlsread('Teo1.xlsx');
   S=S';
   else
   op3=0;
end
if estado4==1
   op4=1;
% % %    s1=xlsread('ECG.xlsx');
% % %    s2=xlsread('EEG.xlsx');
% % %    s1=s1';
% % %    s2=s2';
% % %    Resultat=[s1;s2];
% % %    S=Resultat;
   [Y1 Y2]=ICAEEG();
   else
   op4=0;
end
if estado9==1
   op9=1;
   S=xlsread('SenalCompleja.xlsx');
   S=S';
   else
   op9=0;
end
Resultat=[op1 op2 op3 op4 op9];
Res=Resultat;
input('calcular ICA');
[Y]=MetodICA(T,Fs,Res,S);


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox9
Fs=str2double(get(handles.Fs,'string')); %%Frecuencia de muestreo%%%%%%
if get(hObject,'Value') 
[Y]=SenalCompleja(Fs);
Y=Y';
xlswrite('SenalCompleja.xlsx',Y);
end


% --- Executes during object creation, after setting all properties.
function checkbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
