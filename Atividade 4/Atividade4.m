% Carregar o arquivo de áudio
[y, Fs] = audioread('frase02_2095920.wav');  % Carregar o arquivo de áudio

% Ajustar parâmetros para o espectrograma
window = 128;          % Tamanho da janela reduzido
noverlap = 64;         % Sobreposição reduzida para 50%
nfft = 256;            % Número de pontos na FFT reduzido

% Criar o espectrograma
spectrogram(y, window, noverlap, nfft, Fs, 'yaxis');  % Gera o espectrograma
% ylim([0 4000]);                                    % Removido o limite do eixo y temporariamente
title('Frase: Ela saia discretamente');                  % Título em português
xlabel('Tempo (s)');                                 % Rótulo do eixo x
ylabel('Frequência (Hz)');                           % Rótulo do eixo y
colormap('jet');                                    % Aplica o colormap 'jet'
grid on;                                            % Ativar o grid

% Adicionar a barra de cores com o rótulo em português
c = colorbar;
ylabel(c, 'Potência/Frequência (dB/Hz)');           % Rótulo da barra de cores em português

% Salvar o espectrograma como JPG
saveas(gcf, 'espectrograma_frase02.jpg');           % Salva o gráfico em JPG
