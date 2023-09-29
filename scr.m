I = imread('i2.png'); 
row = size(I, 1) / 4;
col = size(I, 2) / 4;
I_scramble = mat2cell(I, ones(1, row) * 4, ones(1, col) * 4, size(I, 3));
I_scramble = cell2mat(reshape(I_scramble(randperm(row * col)), row, col));
imshow(I_scramble);