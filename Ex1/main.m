% 实验一 图像处理的基本操作和图像直方图均衡化
clc;
clear;
close all;

%% 1. 图像读写
% (A) 图像读出
I = imread('Ex1/boat.bmp');

% (B) 图像写入
whos I;
imwrite(I, 'Ex1/boat1.bmp');

%% 2. 图像显示
% (A) 灰度图像的显示
figure;
imshow(I);

% (B) RGB 图像的显示
RGB = imread('Ex1/flower.tif');
figure;
imshow(RGB);
figure;
imshow(RGB(:,:,3));  % 显示第 3 个颜色分量

%% 3. 图像的基本运算
% (A) 图像的缩放
I = imread('Ex1/lena.tif');
J = imresize(I, 0.5);
figure;
imshow(I);
title('原图');
figure;
imshow(J);
title('比例缩小图');

% (B) 图像的旋转
J = imrotate(I, 90);    % 图像逆时针旋转 90 度
K = imrotate(I, 180);
figure;
subplot(1,3,1);
imshow(I);
title('原图');
subplot(1,3,2);
imshow(J);
title('旋转 90 度图');
subplot(1,3,3);
imshow(K);
title('旋转 180 度图');

%% 4. 彩色图像分通道显示及常用彩色空间转换
% (A) 彩色图像的分通道显示
RGB = imread('Ex1/peppers.bmp');
R = RGB(:,:,1);  % R 通道
G = RGB(:,:,2);  % G 通道
B = RGB(:,:,3);  % B 通道
figure;
subplot(2,2,1);
imshow(RGB);
title('原始图像');
subplot(2,2,2);
imshow(R);
title('R 分量');
subplot(2,2,3);
imshow(G);
title('G 分量');
subplot(2,2,4);
imshow(B);
title('B 分量');

% (B) 常用彩色空间转换
RGB = imread('Ex1/peppers.bmp');
HSI = rgb2hsi(RGB);     % RGB 空间转换为 HSI 空间
YCBCR = rgb2ycbcr(RGB); % RGB 空间转换为 YCbCr 空间
figure;
subplot(1,3,1);
imshow(HSI(:,:,1));
title('H 分量图');
subplot(1,3,2);
imshow(HSI(:,:,2));
title('S 分量图');
subplot(1,3,3);
imshow(HSI(:,:,3));
title('I 分量图');
figure;
subplot(1,3,1);
imshow(YCBCR(:,:,1));
title('Y 分量图');
subplot(1,3,2);
imshow(YCBCR(:,:,2));
title('Cb 分量图');
subplot(1,3,3);
imshow(YCBCR(:,:,3));
title('Cr 分量图');

%% 5. 图像的直方图显示与灰度直方图均衡化
% (A) 图像的直方图显示
% 1. 显示原始图像及其直方图
I = imread('Ex1/cameraman1.tif');
figure;
subplot(1,2,1);
imshow(I);
title('原始图像');
subplot(1,2,2);
imhist(I);
title('原始图像直方图');

% 2. 不同灰度级的直方图显示
I = imread('Ex1/rice1.tif');
figure;
subplot(2,2,1);
imshow(I);
title('原始图像');
subplot(2,2,2);
imhist(I, 64);
title('n=64 的直方图');
subplot(2,2,3);
imhist(I, 128);
title('n=128 的直方图');
subplot(2,2,4);
imhist(I, 256);
title('n=256 的直方图');

% 3. 观察不同图像的直方图
I = imread('Ex1/pollen1.tif');
J = imread('Ex1/pollen2.tif');
figure;
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imhist(I, 256);
subplot(2,2,3);
imshow(J);
subplot(2,2,4);
imhist(J, 256);

% 4. 旋转图像前后的直方图对比
I = imread('Ex1/boat.bmp');
J = imrotate(I, 180);
figure;
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imhist(I, 256);
subplot(2,2,3);
imshow(J);
subplot(2,2,4);
imhist(J, 256);

% (B) 图像的灰度直方图均衡化
I = imread('Ex1/pollen1.tif');
figure;
subplot(2,2,1);
imshow(I);
title('原始图像');
subplot(2,2,3);
imhist(I, 256);
title('原始图像直方图');
J = histeq(I, 256); % 直方图均衡化，灰度级为 256
subplot(2,2,2);
imshow(J);
title('均衡化后图像');
subplot(2,2,4);
imhist(J, 256);
title('均衡化后图像直方图');