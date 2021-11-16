function thresholding_edge_mask3()
close all

im = imread('eagle.jpg');

[row, col, dim] = size(im)
im2 = zeros(row,col,dim);   % creating a new image with the same size
size(im2)
for i=1:row
    for j=1:col
        if(im(i,j,:)>97)
            im2(i,j,:) = im(i,j,:);
        end
    end
end

h=[1,0,-1; 1,0, -1;1,0,-1]
im_mask_1 = conv2(rgb2gray(im2),h);

h2 = [1, 0; 0, -1]
im_mask_2 = conv2(im_mask_1,h2);

h3 = [0, 1; -1, 0]
im_mask_3 = conv2(im_mask_2,h3);

h4 = [-1, 0, -1; 1, 0, 1; -1, 0, -1]
im_mask_4 = conv2(im_mask_3,h4);

if dim>1
    im_gray = rgb2gray(im);
else
    im_gray = im;
end
im_sobel = edge(im_gray,'sobel');
im_canny = edge(im_gray,'canny');
im_log = edge(im_gray,'log');
im_roberts = edge(im_gray,'roberts');


figure(2),
subplot(2,4,1),
subimage(im);
title('Original-0')
axis off
subplot(2,4,2),
subimage(im2);
title(['Threshold=',num2str(97)])
axis on

subplot(2,4,3),
subimage(im_sobel);
title('Sobel')
%axis off 
subplot(2,4,4),
subimage(im_canny);
title('Canny')
%axis off


subplot(2,4,5),
subimage(im_roberts);
title('Roberts')
%axis off

subplot(2,4,6),
subimage(im_mask_1);
title('Thres+mask1')
%axis off
         
subplot(2,4,7),
subimage(im_mask_2);
title('Thres+mask2')
%axis off

subplot(2,4,8),
subimage(im_mask_3);
title('Mymethod')
%axis off


