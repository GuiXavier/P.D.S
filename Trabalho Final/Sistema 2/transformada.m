% Limpar variáveis e console
clear; clc; close all;

% Carregar o arquivo de áudio
arquivo = 'sistema2.wav'; % Nome do arquivo de áudio
if exist(arquivo, 'file') % Verifica se o arquivo existe
    [y, Fs] = audioread(arquivo);
else
    error('Arquivo de áudio não encontrado: %s', arquivo);
end

% Se o áudio tiver 2 canais, converter para mono
if size(y, 2) > 1
    y = mean(y, 2);  % Média dos canais para obter um único canal
end

% Determinar o envelope superior e inferior usando a Transformada de Hilbert
[superior, inferior] = envelope(y);  % Determina o envelope superior e inferior

% Determinar o envelope suavizado com o método RMS
[superior_rms, inferior_rms] = envelope(y, 150, 'rms');  % Envelope suavizado

% Criar a figura
figure;

% Sinal Original
subplot(3, 1, 1);
plot((1:length(y)) / Fs, y, 'b');  
title('Sistema 1 - Sinal Original');  
legend({'Sinal original'}, 'Location', 'northoutside'); % Legenda acima do gráfico
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  

% Envelope Superior e Inferior
subplot(3, 1, 2);
plot((1:length(y)) / Fs, superior, 'k', (1:length(y)) / Fs, inferior, 'k');  
legend({'Envelope Superior', 'Envelope Inferior'}, 'Location', 'northoutside'); % Legenda acima do gráfico
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  

% Envelope Suavizado (RMS)
subplot(3, 1, 3);
plot((1:length(y)) / Fs, superior_rms, 'm', (1:length(y)) / Fs, -superior_rms, 'm');  
legend({'Envelope Suavizado (RMS)'}, 'Location', 'northoutside'); % Legenda acima do gráfico
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;  

% Ajustar o tamanho da figura para evitar sobreposição
set(gcf, 'Position', [100, 100, 900, 700]); % Ajusta o tamanho da janela da figura

% Salvar a figura corrigida
saveas(gcf, 'transhilbert_corrigido.jpg');  % Salva a figura como JPG
