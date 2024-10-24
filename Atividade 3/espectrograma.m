% Carregar o arquivo de áudio
[y, Fs] = audioread('frase02_2095920.wav');  % Carregar o arquivo de áudio

% Definir parâmetros para o espectrograma
window = 256;          % Tamanho da janela
noverlap = 128;        % Sobreposição das janelas
nfft = 512;            % Número de pontos na FFT

% Criar o espectrograma
spectrogram(y, window, noverlap, nfft, Fs, 'yaxis');  % Gera o espectrograma
title('Frase: Ela saia discretamente.');             % Título em português
xlabel('Tempo (s)');                                 % Rótulo do eixo x
ylabel('Frequência (Hz)');                           % Rótulo do eixo y
colormap('jet');                                    % Aplica o colormap 'jet'
grid off;                                            % Ativar o grid

% Salvar o espectrograma como JPG
saveas(gcf, 'frase02_2095920.jpg');           % Salva o gráfico em JPG