Image1=imread('i2.png');
totalEntropy = entropy(Image1);
message = sprintf('The entropy of the image is %f.', totalEntropy);
fprintf('%s\n', message);
msgbox(message);