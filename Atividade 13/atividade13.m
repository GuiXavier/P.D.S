% Carregar os dados do sinal EMG
load('08.mat'); 

fs = 2000; % Frequência de amostragem (Hz)
Tq = 200e-3; % Tamanho do quadro (200 ms)
delta_Tq = 10e-3; % Deslocamento do quadro (10 ms)

N = round(Tq * fs); % Número de amostras por quadro
delta_N = round(delta_Tq * fs); % Deslocamento em amostras

% Vetor de tempo
tempo = (0:length(tmp)-1) / fs;

% Cálculo do MAV
num_quadros = floor((length(tmp) - N) / delta_N) + 1;
MAV = zeros(1, num_quadros);
tempo_MAV = zeros(1, num_quadros);

for k = 1:num_quadros
    indice_inicial = (k-1) * delta_N + 1;
    indice_final = indice_inicial + N - 1;
    
    if indice_final > length(tmp)
        break;
    end
    
    quadro = tmp(indice_inicial:indice_final);
    MAV(k) = mean(abs(quadro));
    tempo_MAV(k) = tempo(indice_inicial);
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
legend('Sinal EMG', 'Location', 'northeastoutside'); % Posiciona a legenda fora do gráfico

% Plotando MAV
subplot(2,1,2);
plot(tempo_MAV, MAV);
title('Valor Médio Absoluto (MAV)');
xlabel('Tempo (s)');
ylabel('MAV');
grid on;
legend('Mean Absolute Value (MAV)', 'Location', 'northeastoutside'); % Posiciona a legenda fora do gráfico

% Ajustar tamanho da figura para evitar sobreposição
set(gcf, 'Position', [100, 100, 900, 600]); % Aumenta o tamanho da janela para acomodar as legendas

% Salvar a figura
saveas(gcf, 'resultado_EMG.jpg');
