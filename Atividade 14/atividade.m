% Carregar os dados do sinal EMG
load('08.mat'); % Certifique-se de que o arquivo contém a variável correta

fs = 2000; % Frequência de amostragem (Hz)
Tq = 200e-3; % Tamanho do quadro (200 ms)
delta_Tq = 10e-3; % Deslocamento do quadro (10 ms)

N = round(Tq * fs); % Número de amostras por quadro
delta_N = round(delta_Tq * fs); % Deslocamento em amostras

% Vetor de tempo
tempo = (0:length(tmp)-1) / fs;

% Cálculo do Zero Crossing (ZC)
num_quadros = floor((length(tmp) - N) / delta_N) + 1;
ZC = zeros(1, num_quadros);
tempo_ZC = zeros(1, num_quadros);

for k = 1:num_quadros
    indice_inicial = (k-1) * delta_N + 1;
    indice_final = indice_inicial + N - 1;
    
    if indice_final > length(tmp)
        break;
    end
    
    quadro = tmp(indice_inicial:indice_final);
    
    % Contagem de zero crossings
    ZC(k) = sum((quadro(1:end-1) .* quadro(2:end)) < 0);
    
    tempo_ZC(k) = tempo(indice_inicial);
end

% Criar figura
figure;

% Plotando o sinal EMG original
subplot(2,1,1);
plot(tempo, tmp);
title('Sinal EMG');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;
legend('Sinal EMG', 'Location', 'northeastoutside');

% Plotando Zero Crossing (ZC)
subplot(2,1,2);
plot(tempo_ZC, ZC);
title('Zero Crossing (ZC)');
xlabel('Tempo (s)');
ylabel('ZC');
grid on;
legend('Zero-crossing (ZC)', 'Location', 'northeastoutside');

% Ajustar tamanho da figura para evitar sobreposição
set(gcf, 'Position', [100, 100, 900, 600]);

% Salvar a figura
saveas(gcf, 'resultado_ZC.jpg');
