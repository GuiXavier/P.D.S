% Carregar o arquivo .mat
load('08.mat');  % Substitua pelo nome correto do seu arquivo

% Definir parâmetros
fs = 2000;  % Frequência de amostragem (Hz)
tempo = (0:length(tmp)-1) / fs;  % Criar vetor de tempo correspondente ao sinal

% Plotar o sinal EMG
figure;
plot(tempo, tmp, 'b');  % Plotar o sinal em azul
grid on;  % Ativar o grid
title('Amostra EMG: 08.mat');  % Título do gráfico
xlabel('Tempo (s)');  % Rótulo do eixo X
ylabel('Amplitude');  % Rótulo do eixo Y

% Salvar o gráfico como JPG
saveas(gcf, 'sinal_EMG_08.jpg');  % Salva a figura no formato JPG
