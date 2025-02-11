% Carregar o arquivo de áudio
[y, Fs] = audioread('sistema3.wav');  % Substitua pelo nome correto do arquivo de áudio

% Definir parâmetros para o espectrograma
window = 256;          % Tamanho da janela
noverlap = 128;        % Sobreposição das janelas
nfft = 512;            % Número de pontos na FFT

% Criar o espectrograma e obter os valores de frequência e potência
[S, F, T, P] = spectrogram(y, window, noverlap, nfft, Fs);  
P_dB = 10*log10(P);  % Converter a potência para escala logarítmica (decibéis)

% Limitar o espectrograma a 1 kHz
F_limit = F(F <= 1000);   % Frequências até 1 kHz
P_limit = P_dB(F <= 1000, :);  % Potência correspondente às frequências limitadas

% Plotar o espectrograma com a faixa de frequência limitada
figure;
imagesc(T, F_limit, P_limit);  % Exibir o espectrograma
axis xy;  % Corrigir a orientação dos eixos
colormap('jet');  % Aplica o colormap 'jet'
c = colorbar;  % Adicionar barra de cores
ylabel(c, 'Potência/Frequência (dB/Hz)');  % Adicionar rótulo à barra de cores

% Configuração dos eixos e título
title('Espectrograma Sistema 3');  % Título em português
xlabel('Tempo (s)');  % Rótulo do eixo x
ylabel('Frequência (Hz)');  % Rótulo do eixo y

% Salvar o espectrograma como JPG
saveas(gcf, 'espectrograma3.jpg');  % Salva o gráfico como JPG
