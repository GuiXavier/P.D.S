% Carregar a imagem
imagem_original = imread('imagem03_2095920.jpg');  % Substitua pelo nome correto do arquivo da imagem

% Converter a imagem para escala de cinza
imagem_cinza = rgb2gray(imagem_original);

% Criar o filtro passa-baixa 10x10
filtro = ones(10) / 100;

% Aplicar o filtro passa-baixa
imagem_borrada = filter2(filtro, imagem_cinza);

% Criar a figura com a imagem original em escala de cinza e a borrada
figure;

% Imagem original em escala de cinza
subplot(2, 1, 1);
imshow(imagem_cinza);
title('Imagem em escala cinza');

% Imagem borrada
subplot(2, 1, 2);
imshow(uint8(imagem_borrada));  % Converter para uint8 para exibição correta
title('Imagem borrada');

% Salvar a figura em formato JPG
saveas(gcf, 'imagem_borrada.jpg');  % Salva a figura como JPG
