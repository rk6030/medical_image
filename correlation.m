clc;
close all;

 I1=imread('E:\MATLAB\Results\cor\image1.tif');
 I=rgb2gray(I1);
 A = im2double(I);
 %encrypted image
    I2=imread('E:\MATLAB\Results\.tif');
  I3=rgb2gray(I2);
     A2 = im2double(I3);


    %For GRAY image
    %==================================================
    %Original Image
    %horizontal
    x1 = A(:,1:end-1);  
    y1 = A(:,2:end);
    
    r1=randperm(numel(x1));
    r1=r1(1:3000);
    x=x1(r1);
    y=y1(r1);
    %r_xy=corrcoef(x,y);
    
      kyatayO=hesap(x1,y1);
      hi=kyatayO(2);
    %Vertical
    x2 = A(1:end-1,:);  
    y2 = A(2:end,:);    
    kdikeyO=hesap(x,y);
    vi=kdikeyO(2);
    %diagonal
    x3 = A(1:end-1,1:end-1);  
    y3 = A(2:end,2:end);     
    kkosegenO=hesap(x3,y3);
    di=kkosegenO(2);

%     %==================================================
    %for encrypted image
    %horizontal
            x4 = A2(:,1:end-1);  
            y4 = A2(:,2:end);
            kyatayI=hesap(x4,y4);
            he=kyatayI(2);
    %Vertical
            x5 = A2(1:end-1,:);  
            y5 = A2(2:end,:);    
            kdikeyI=hesap(x5,y5);
            vi1=kdikeyI(2);
    %diagonal
            x6 = A2(1:end-1,1:end-1);  
            y6 = A2(2:end,2:end);     
            kkosegenI=hesap(x6,y6);
            di1=kkosegenI(2);
%     %==================================================
    %graphics
    h=figure;   
    subplot(3,2,1),grafik(x1,y1),title('Horizontal');
    subplot(3,2,3),grafik(x2,y2),title('Vertical');
    subplot(3,2,5),grafik(x3,y3),title('Diagonal');
    subplot(3,2,2),grafik(x4,y4),title('Horizontal');
    subplot(3,2,4),grafik(x5,y5),title('Vertical');
    subplot(3,2,6),grafik(x6,y6),title('Diagonal');
   
    fprintf('Horizontal Co %.4f.\n ENC  = %.4f. \n',hi,he);
     fprintf('Vertical Co %.4f.\n ENC  = %.4f. \n',vi,vi1);
     fprintf('Diagonal Co %.4f.\n ENC  = %.4f. \n',di,di1);
%            fprintf('Horizontal Co %.4f.\n',hi);
%      fprintf('Vertical Co %.4f.\n',vi);
%       fprintf('Diagonal Co %.4f.\n',di);
  


     

%saveas(h,'correlationGray.jpg');
 %=======================================

scatter(x,y);
xlabel('Pixel gray value on location (x,y)')
ylabel('Pixel gray value on location (x+1,y)')
