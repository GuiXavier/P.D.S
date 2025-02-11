% Carregar o arquivo de áudio
[y, Fs] = audioread('sistema1.wav');  % Carregar o arquivo de áudio

% Se o áudio tiver 2 canais, converter para mono
if size(y, 2) > 1
    y = mean(y, 2);  % Média dos canais para obter um único canal
end

% Determinar o envelope superior e inferior usando a Transformada de Hilbert
[superior, inferior] = envelope(y);  % Determina o envelope superior e inferior

% Determinar o envelope suavizado com o método RMS
[superior_rms, inferior_rms] = envelope(y, 150, 'rms');  % Envelope suavizado

% Gerar a figura com os três gráficos
figure;

% Sinal Original
subplot(3, 1, 1);
plot((1:length(y)) / Fs, y, 'b');  % Sinal original em azul
title('Sistema 1 - Sinal Original');  % Título mais descritivo
legend('Sinal original');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  % Ativar o grid

% Envelope Superior e Inferior
subplot(3, 1, 2);
plot((1:length(y)) / Fs, superior, 'k', (1:length(y)) / Fs, inferior, 'k');  % Envelope superior e inferior em preto
legend('Envelope Superior', 'Envelope Inferior');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  % Ativar o grid

% Envelope Suavizado (RMS)
subplot(3, 1, 3);
plot((1:length(y)) / Fs, superior_rms, 'm', (1:length(y)) / Fs, -superior_rms, 'm');  % Envelope suavizado em rosa
legend('Envelope Suavizado (RMS)');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  % Ativar o grid

% Salvar a figura em formato JPG
saveas(gcf, 'transhilbert.jpg');  % Salva a figura como 'transhilbert.jpg'
