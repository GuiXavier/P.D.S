% Carregar o arquivo de áudio
[y, Fs] = audioread('frase04_2095920.wav');  % Substitua 'frase04_2095920.wav' pelo nome correto do arquivo de áudio

% Determinar o envelope superior e inferior usando a Transformada de Hilbert
[superior, inferior] = envelope(y);  % Determina o envelope superior e inferior

% Determinar o envelope suavizado com o método RMS
[superior_rms, inferior_rms] = envelope(y, 150, 'rms');  % Envelope suavizado

% Gerar a figura com os três gráficos
figure;
subplot(3, 1, 1);
plot((1:length(y)) / Fs, y, 'b');  % Sinal original em azul
title('Frase: Seu crime foi totalmente encoberto.');  % Título em português
legend('Sinal original');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  % Ativar o grid

subplot(3, 1, 2);
plot((1:length(y)) / Fs, superior, 'k', (1:length(y)) / Fs, inferior, 'k');  % Envelope superior e inferior em preto
legend('Envelope Superior e Inferior - Transformada de Hilbert');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  % Ativar o grid

subplot(3, 1, 3);
plot((1:length(y)) / Fs, superior_rms, 'm', (1:length(y)) / Fs, -superior_rms, 'm');  % Envelope suavizado em rosa
legend('Envelope - Suavizado (RMS)');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  % Ativar o grid

% Salvar a figura em formato JPG
saveas(gcf, 'envelope_frase04.jpg');  % Salva a figura como 'envelope_frase04.jpg'
