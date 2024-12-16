% Carregar a imagem
imagem = imread('imagem01_2095920.jpg');  % Substitua pelo nome correto do arquivo

% Decompor a imagem nas camadas R, G e B
R = imagem(:, :, 1);  % Camada vermelha
G = imagem(:, :, 2);  % Camada verde
B = imagem(:, :, 3);  % Camada azul

% Criar a figura com a imagem original e as camadas R, G e B
figure;

% Imagem original
subplot(2, 2, 1);
imshow(imagem);
title('Imagem Original');

% Componente R
subplot(2, 2, 2);
imshow(R);
title('Componente R');

% Componente G
subplot(2, 2, 3);
imshow(G);
title('Componente G');

% Componente B
subplot(2, 2, 4);
imshow(B);
title('Componente B');

% Salvar a figura em formato JPG
saveas(gcf, 'imagem_decomposicao_RGB.jpg');  % Salva a figura como JPG
