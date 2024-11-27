% Carregar o arquivo de áudio
[y, original_fs] = audioread('frase05_2095920.wav');  % Substitua 'frase05.wav' pelo nome correto do arquivo de áudio

% Frequências de amostragem solicitadas
fs_values = [4000, 8000, 12000, 16000, 20000, 24000];  % Em Hz
times = zeros(size(fs_values));  % Para armazenar os tempos de reprodução

% Processar e calcular o tempo de reprodução para cada fs
for i = 1:length(fs_values)
    fs = fs_values(i);
    % Criar um objeto de áudio com a nova frequência de amostragem
    player = audioplayer(y, fs);
    % Reproduzir o áudio
    disp(['Reproduzindo áudio com fs = ', num2str(fs), ' Hz']);
    playblocking(player);  % Reproduz o áudio e espera finalizar antes de continuar
    % Calcular o tempo de reprodução (duração do sinal em segundos)
    times(i) = length(y) / fs;
end

% Converter frequências para kHz para o eixo x
fs_khz = fs_values / 1000;

% Plotar o gráfico
figure;
plot(fs_khz, times, '-o', 'LineWidth', 1.5);
title('Frase: Estou certo que mereço a atenção dela.');  % Título do gráfico
xlabel('Frequência de amostragem (kHz)');       % Rótulo do eixo x
ylabel('Tempo de reprodução (s)');             % Rótulo do eixo y
grid on;                                       % Adicionar grid
saveas(gcf, 'frequencia_digital_frase05.jpg'); % Salvar o gráfico como JPG
audiowrite(['frase05_fs_' num2str(fs) '.wav'], y, fs);
