% Carregar o arquivo de áudio
[y, Fs] = audioread('frase03_2095920.wav');  % Substitua 'frase03.wav' pelo nome correto do arquivo de áudio

% Filtro passa-baixa de ordem 4 com frequência de corte de 0,6 kHz
fc_lp = 0.6e3;  % Frequência de corte em Hz
Wn_lp = fc_lp / (Fs / 2);  % Frequência de corte normalizada pela frequência de Nyquist
[b_lp, a_lp] = butter(4, Wn_lp, 'low');  % Coeficientes do filtro passa-baixa
y_lp = filter(b_lp, a_lp, y);  % Aplicar o filtro passa-baixa

% Filtro passa-alta de ordem 6 com frequência de corte de 3,0 kHz
fc_hp = 3.0e3;  % Frequência de corte em Hz
Wn_hp = fc_hp / (Fs / 2);  % Frequência de corte normalizada pela frequência de Nyquist
[b_hp, a_hp] = butter(6, Wn_hp, 'high');  % Coeficientes do filtro passa-alta
y_hp = filter(b_hp, a_hp, y);  % Aplicar o filtro passa-alta

% Plotar o sinal original e os sinais filtrados
figure;
subplot(3, 1, 1);
plot((1:length(y)) / Fs, y);
title('Frase: Espero te achar bem quando voltar.');
legend('Original');
xlabel('tempo (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot((1:length(y_lp)) / Fs, y_lp);
legend('Saída de filtro passa-baixa com corte em 0,6 kHz');
xlabel('tempo (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot((1:length(y_hp)) / Fs, y_hp);
legend('Saída de filtro passa-alta com corte em 3,0 kHz');
xlabel('tempo (s)');
ylabel('Amplitude');

% Salvar a figura em formato JPG
saveas(gcf, 'filtros_frase03.jpg');  % Salva a figura como 'filtros_frase03.jpg'
