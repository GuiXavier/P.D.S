% Carregar o arquivo de áudio
[y, Fs] = audioread('sistema2.wav');  % Substitua pelo nome correto do arquivo de áudio

% Definir parâmetros para o espectrograma
window = 256;          % Tamanho da janela
noverlap = 128;        % Sobreposição das janelas
nfft = 512;            % Número de pontos na FFT

% Criar o espectrograma e obter os valores de frequência e potência
[S, F, T, P] = spectrogram(y, window, noverlap, nfft, Fs);  
P_dB = 10*log10(P + eps);  % Converter a potência para escala logarítmica (decibéis) e evitar log(0)

% Plotar o espectrograma sem limitação de frequência
figure;
imagesc(T, F, P_dB);  % Exibir o espectrograma sem limitar a faixa de frequência
axis xy;  % Corrigir a orientação dos eixos
colormap('jet');  % Aplica o colormap 'jet'
c = colorbar;  % Adicionar barra de cores
ylabel(c, 'Potência/Frequência (dB/Hz)');  % Adicionar rótulo à barra de cores

% Configuração dos eixos e título
title('Espectrograma Sistema 2 ');  % Título em português
xlabel('Tempo (s)');  % Rótulo do eixo x
ylabel('Frequência (Hz)');  % Rótulo do eixo y

% Salvar o espectrograma como JPG
saveas(gcf, 'semlimite.jpg');  % Salva o gráfico como JPG
