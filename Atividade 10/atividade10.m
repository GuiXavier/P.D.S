% Carregar a imagem
imagem_original = imread('imagem02_2095920.jpg');  % Substitua pelo nome correto do arquivo da imagem

% Converter a imagem para escala de cinza
imagem_cinza = rgb2gray(imagem_original);

% Definir o limiar de binarização
limiar = 130;
imagem_binarizada = imagem_cinza >= limiar;  % 1 se maior ou igual a 130, 0 caso contrário

% Criar a figura com a imagem original e a binarizada
figure;

% Imagem original
subplot(2, 1, 1);
imshow(imagem_cinza);
title('Imagem Original');

% Imagem binarizada
subplot(2, 1, 2);
imshow(imagem_binarizada);
title('Imagem Binarizada');

% Salvar a figura em formato JPG
saveas(gcf, 'imagem_binarizada.jpg');  % Salva a figura como JPG
