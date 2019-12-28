Img=imread('Baboon2.png'); 
x=x-1;
count=1;
% extracting the hidden watermark 
for i=1:row
    for j=1:col
        if Img(i,j)==x
            arr(count)=0;
            count=count+1;
        elseif Img(i,j)==x+1
            arr(count)=1;
            count=count+1;
        end
    end
end
% sifting the histogram by -1
x=x+1;
for i=1:row
    for j=1:col
        if and(Img(i,j)>=x,Img(i,j)<y)
            Img(i,j)=Img(i,j)-1;
        end
    end
end
figure,
subplot(2,1,1);
imhist(img)
title('Histogram of embedded image');
subplot(2,1,2);
imhist(Img);
title('Histogram of image after Extraction');

figure,
subplot(1,2,1);
imshow(img)
title('embedded image');
subplot(1,2,2);
imshow(Img);
title('Image after Extraction');
X=img;
Y=Img;
diff=imabsdiff(X,Y);
figure
imshow(diff,[])

isequal(BW,arr)
