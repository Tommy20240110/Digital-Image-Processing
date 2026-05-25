% 实验三 图像二维离散傅里叶变换与性质
clc;
clear;
close all;

%% 1. 显示图像的离散傅里叶变换的幅度谱和相位谱
% (A) 显示图像的离散傅里叶变换的幅度谱
I = imread('Ex3/cameraman1.tif');   % 读取图像
J = fftshift(fft2(I));              % 求图像的傅里叶变换谱并进行频谱中心化
figure;
imshow(I);
title('原始图像');
figure;
imshow(log(1 + abs(J)), []);
title('原始图像的幅度谱');          % 采用对数方法显示原图的幅度谱

% (B) 显示图像的离散傅里叶变换的幅度谱和相位谱
I = imread('Ex3/lena.tif');         % 读取图像
J = fftshift(fft2(I));              % 求图像的傅里叶变换谱并进行频谱中心化
figure;
subplot(1, 2, 1);
imshow(angle(J));
title('原图像相位谱');              % 显示原图的相位谱
subplot(1, 2, 2);
imshow(log(1 + abs(J)), []);
title('原图像的幅度谱');            % 对数方法显示原图的幅度谱

% (C) 显示高斯低通滤波输出图的幅度谱
I = imread('Ex3/cameraman1.tif');   % 读取图像
J = fftshift(fft2(I));              % 求图像的傅里叶变换谱并进行频谱中心化
h = fspecial('gaussian', 21, 2);
K = imfilter(I, h);                 % 求图像的高斯低通滤波
L = fftshift(fft2(K));
figure;
subplot(1, 2, 1);
imshow(log(1 + abs(J)), []);
title('原始图像的幅度谱');          % 对数方法显示原图幅度谱
subplot(1, 2, 2);
imshow(log(1 + abs(L)), []);
title('高斯低通滤波输出图的幅度谱'); % 采用对数方法显示高斯低通滤波输出图的幅度谱

%% 2. 二维离散傅里叶逆变换
I = imread('Ex3/lena.tif');         % 读取图像
J = fft2(I);                        % 求图像的傅里叶变换谱
K = ifft2(J);                       % 采用二维离散傅里叶逆变换重构图像
figure;
subplot(1, 2, 1);
imshow(I);
title('原始图像');
subplot(1, 2, 2);
imshow(real(K), []);
title('傅里叶变换谱的重构图');      % 傅里叶变换谱的重构图

%% 3. 傅里叶变换谱实部的二维离散傅里叶逆变换
J = real(fft2(I));                  % 求图像傅里叶变换谱的实部
K = ifft2(J);
figure;
subplot(1, 2, 1);
imshow(I);
title('原始图像');
subplot(1, 2, 2);
imshow(real(K), []);
title('傅里叶变换谱实部的重构图');  % 显示傅里叶变换谱实部的重构图

%% 4. 傅里叶变换相位信息的二维离散傅里叶逆变换
J = fft2(I) ./ abs(fft2(I));
K = ifft2(J);
figure;
subplot(1, 2, 1);
imshow(I);
title('原始图像');
subplot(1, 2, 2);
imshow(real(K), []);
title('傅里叶变换相位信息的重构图'); % 显示傅里叶变换相位信息的重构图

%% 5. 图像二维离散傅里叶变换的性质
% (A) 二维离散傅里叶变换的可分离性
[M, N] = size(I);
J = zeros(M, N);
K = zeros(M, N);
for i = 1 : M
    J(i, :) = fft(I(i, :));         % 先执行行方向一维 FFT
end
for j = 1 : N
    K(:, j) = fft(J(:, j));         % 接着执行列方向的一维 FFT
end
H = ifft2(K);                       % 对图像的傅里叶变换谱执行二维离散傅里叶逆变换
figure;
subplot(1, 2, 1);
imshow(log(1 + abs(fftshift(K))), []);
title('原始图像的幅度谱');
subplot(1, 2, 2);
imshow(real(H), []);
title('傅里叶变换谱的重构图');

% (B) 二维离散傅里叶变换的旋转性质
I = imread('Ex3/boat.bmp');
J = imrotate(I, 90);
K = fftshift(fft2(I));
L = fftshift(fft2(J));
figure;
subplot(1, 2, 1);
imshow(log(1 + abs(K)), []);
title('原始图像的幅度谱');
subplot(1, 2, 2);
imshow(log(1 + abs(L)), []);
title('图像旋转90度后的幅度谱');

% (C) 二维离散傅里叶变换的共轭对称性质
I = imread('Ex3/lena.tif');         % 读取图像
J = fft2(I);
K = conj(J);                        % 对傅里叶变换谱求共轭
H = ifft2(K);
figure;
imshow(real(H), []);
title('傅里叶变换谱求共轭后的重构图');

% (D) 二维离散傅里叶变换的平移性质
I = imread('Ex3/cameraman1.tif');
J = fftshift(I);                    % 对图像 I 进行循环移位
K = fftshift(fft2(I));              % 求原图像的傅里叶变换谱并进行频谱中心化
L = fftshift(fft2(J));              % 求平移后图像的傅里叶变换谱并进行频谱中心化
figure;
subplot(1, 2, 1);
imshow(log(1 + abs(K)), []);
title('原始图像的幅度谱');
subplot(1, 2, 2);
imshow(log(1 + abs(L)), []);
title('图像平移后的幅度谱');

% (E) 二维离散傅里叶变换的卷积定理和相关定理
% 基于相关运算，通过模板匹配检测文本图像中的字符 a
textimage = imread('text1.png');
a = textimage(32:45, 88:98);        % 字符 a 的模板图像
figure;
imshow(textimage);
title('文本图像');
figure;
imshow(a);
title('字符 a 模板图像');
C = real(ifft2(fft2(textimage) .* fft2(rot90(a, 2), 256, 256)));
figure;
imshow(C, []);
title('相关运算结果');
thresh = 60;                        % 设置相关峰的检测阈值
figure;
imshow(C > thresh);                 % 检测大于阈值的相关峰，则对应的位置为字符 a
title('字符 a 检测结果');