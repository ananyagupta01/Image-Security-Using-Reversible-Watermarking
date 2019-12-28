I=imread('Baboon.jpg');
I=imresize(I,[512 512]);
if ( size (I,3)~= 1) %checking if image is gray or not
    I=rgb2gray(I); %converting the rgb image to gray
end    
imshow(I);
R=imhist(I); 
findpeaks(R) %finding all the peak values
[pixelCounts, grayLevels]= imhist(I); %storing the histogram values into array
m=max(pixelCounts); %function that will find the maximum pixel value
disp(m);
x=find(pixelCounts==m)-1; % value with maximum frequency
y=find(pixelCounts==0)-1; %all the values or a value with zero frequency 
disp(x);
disp(y);
[row,col]=size(I);
%for i=1:row
   % [PKamp,PKtime]=findpeaks(imhist(I));
   % [~,idx]=sort(PKamp,'descend');
   % PKamp(idx(i))
    %PKtime(idx(i))-1   
%end
z=find(y>x); % finding the first zero frequency pixel
y=y(z);
img=I;
[row,col]=size(img);

for i=1:row
    for j=1:col
        if and(img(i,j)>=x, img(i,j)<y)
            img(i,j)=img(i,j)+1; % shifting the histogram 
        end
    end
end
%watermark=imread('logo.png');
%imshow(watermark);
%BW=imbinarize(watermark);
BW=randi([0 1],1,m);% generating random binary watermark with same bits as of max
imshow(BW)
count=1;
x=x+1;
for i=1:row
    for j=1:col
        if img(i,j)==x 
            if BW(count)==0 
                img(i,j)=img(i,j)-1; %shift pixel by -1 where the watermark bit is 0
                count=count+1;
            else
                count=count+1;
            end
        end
    end
end
figure,
subplot(1,2,1);
imshow(I);
title('original Image');
subplot(1,2,2);
imshow(img);
title('embedded image');

figure,
subplot(2,1,1);
imhist(I);
title('Histogram of original Image');
subplot(2,1,2);
imhist(img);
title('Histogram of embedded image');

imwrite(img,'Baboon2.png');

X=I;
Y=img;
Diff=imabsdiff(X,Y);
figure
imshow(Diff,[])

