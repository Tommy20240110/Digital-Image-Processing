% 实验二 图像空间域滤波降噪
clc;
clear;
close all;

%% 1. 给图像加噪声
% (A) 利用函数 imnoise 给图像 'lena.tif' 添加高斯 (gaussian) 噪声
I = imread('Ex2/lena.tif');
figure;
imshow(I);
title('原图');

I1 = imnoise(I, 'gaussian', 0, 0.01);
figure;
imshow(I1);
title('gaussian噪声图');

% (B) 利用函数 imnoise 给图像 'lena.tif' 添加椒盐 (salt & pepper) 噪声
I2 = imnoise(I, 'salt & pepper');
figure;
imshow(I2);
title('椒盐噪声图');

%% 2. 邻域平滑低通滤波滤除高斯噪声
% (A) 邻域均值平滑低通滤波滤除高斯噪声
J = filter2(fspecial('average', 5), I1) / 255;
figure;
imshow(J);
title('均值滤波后图像');

% (B) 邻域加权平均平滑低通滤波滤除高斯噪声
J = filter2(fspecial('gaussian', 5, 2), I1) / 255;
figure;
imshow(J);
title('邻域加权平均平滑低通滤波');

%% 3. 中值滤波滤除椒盐噪声
% (A) 中值滤波滤除椒盐噪声，滤波窗口为 3×3
J = medfilt2(I2, [3, 3]);
figure;
imshow(J);
title('中值滤波后图像');

% (B) 中值滤波滤除椒盐噪声，滤波窗口为 5×5
J = medfilt2(I2, [5, 5]);
figure;
imshow(J);
title('中值滤波后图像');

%% 4. 对加了高斯噪声的图像进行邻域均值滤波和中值滤波，比较滤波效果
J = imnoise(I, 'gauss', 0.02);                    % 添加高斯噪声
K = filter2(fspecial('average', 3), J) / 255;     % 均值滤波模板大小 3×3
L = filter2(fspecial('average', 5), J) / 255;     % 均值滤波模板大小 5×5
M = medfilt2(J, [3, 3]);                          % 中值滤波窗口大小为 3×3
N = medfilt2(J, [5, 5]);                          % 中值滤波窗口大小为 5×5
figure;
subplot(2, 3, 1);
imshow(I);
title('原图');
subplot(2, 3, 2);
imshow(J);
title('加高斯噪声');
subplot(2, 3, 3);
imshow(K);
title('均值滤波 3×3输出图');
subplot(2, 3, 4);
imshow(L);
title('均值滤波 5×5输出图');
subplot(2, 3, 5);
imshow(M);
title('中值滤波3×3输出图');
subplot(2, 3, 6);
imshow(N);
title('中值滤波5×5输出图');

%% 5. 对加了椒盐噪声的图像进行均值滤波和中值滤波，比较滤波效果
J = imnoise(I, 'salt & pepper', 0.02);            % 添加椒盐噪声
K = filter2(fspecial('average', 3), J) / 255;     % 均值滤波模板大小 3×3
L = filter2(fspecial('average', 5), J) / 255;     % 均值滤波模板大小 5×5
M = medfilt2(J, [3, 3]);                          % 中值滤波窗口大小 3×3
N = medfilt2(J, [5, 5]);                          % 中值滤波窗口大小 5×5
figure;
subplot(2, 3, 1);
imshow(I);
title('原图');
subplot(2, 3, 2);
imshow(J);
title('加椒盐噪声');
subplot(2, 3, 3);
imshow(K);
title('均值滤波 3×3输出图');
subplot(2, 3, 4);
imshow(L);
title('均值滤波 5×5输出图');
subplot(2, 3, 5);
imshow(M);
title('中值滤波3×3输出图');
subplot(2, 3, 6);
imshow(N);
title('中值滤波5×5输出图');