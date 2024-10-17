[y, Fs] = audioread('frase01_2095920.wav');  % Carregar o arquivo de áudio
t = (0:length(y)-1) / Fs;                      % Criar o vetor de tempo
plot(t, y);                                    % Plotar o sinal
xlabel('Tempo (s)');                           % Rótulo do eixo x
ylabel('Amplitude');                           % Rótulo do eixo y
title('Frase: Isso se resolverá de forma tranquila.');                        % Adicionar título
grid on;                                       % Ativar o grid
saveas(gcf, 'frase01_2095920.jpg');               % Salvar o gráfico em JPG
