% Proyecto de comunicaciones
% Grupo 
% Daniel Alvarez 201911320
% Nombre 2
% Nombre 3

%% Preprocesado C = 64kbps y Bm = 11kHz

filename = 'Fur-Elise.mp3';
[y, Fs] = audioread(filename);
channel1 = y(:,1);
channel2 = y(:,2);
total_t = length(y)./Fs;
t = 0:total_t/(length(y)):total_t-total_t/length(y);

%% Escritura de archivo .mp4

filename = 'Fur-EliseC1.mp4';
audiowrite(filename,channel1,Fs);

%% Reproducción

sound(y,Fs)

%% Limpieza

clear sound

%% Ploteo en tiempo

plot(t,channel2)
xlabel('tiempo (s)')
ylabel('Amplitud')
legend('Fur-Elise')
grid on 
title('Amplitud vs tiempo(s)')

%% Ploteo en Fourier

yf = abs(fftshift(fft(channel1))); %Transformada de Fourier
L = length(yf);
f = Fs*((-L/2):((L-1)/2))/L;
plot(f,yf)
grid on 
legend('Fur-Elise')
title('Espectro en frecuencia de archivo')
xlabel('Hz')
ylabel('A')

%% Conversion de archivo a integer desde float

fid = fopen('Fur-Elise.mp3', 'r');
mp3_content = fread(fid, [1 10^3], '*uint8');
fclose(fid);
%%

plot(file(1:100))
xlabel('muestra (#)')
ylabel('Amplitud')
legend('Fur-Elise')
grid on 
title('Amplitud vs muestra (8 bits)')

%% Conversion de archivo a binario

for i = 1:length(mp3_content)
    if (i==1)
    file(i:i+7) = decimalToBinaryVector(mp3_content(i),8,'MSBFirst');
    else
     n = (i-1)*8;
     file(n:n+7) = decimalToBinaryVector(mp3_content(i),8,'MSBFirst');
    end
end
