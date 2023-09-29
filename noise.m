i=imread('i2.png');
new_i=imnoise(i,'salt & pepper', 0.05); %noise added in this step for a 5% corrupted pixels
new_j=imnoise(i,"gaussian",0.1);
figure,imshow(new_i)
figure,imshow(new_j)
imwrite(new_i,'new_i.png')
imwrite(new_j,'new_j.png')


