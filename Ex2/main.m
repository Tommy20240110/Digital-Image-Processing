% 实验二    实验二 图像空间域滤波降噪
% 五、实验步骤
% 1.给图像加噪声
    %  (1).利用函数imnoise给图像‘lena.tif’添加高斯(gaussian)噪声。
      clear all;
      clc;
      I=imread('lena.tif');
     imshow(I);title('原图')
     I1=imnoise(I,'gaussian',0,0.01);
     figure,imshow(I1);title('gaussian噪声图')
  
 
% (2).利用函数imnoise给图像‘lena.tif’添加椒盐(salt & pepper)噪声。

clear all;
clc;
I=imread('lena.tif');
imshow(I);title('原图')
I2=imnoise(I,'salt & pepper');
figure,imshow(I2);title('椒盐噪声图')


% 2.邻域平滑低通滤波滤除高斯噪声
     % (1)．邻域均值平滑低通滤波滤除高斯噪声
     % 在matlab环境中，程序首先读取图像，然后调用图像空域滤波函数，设置相关参数，再输出处理后的图像。
     
       clear all;
      clc;
      I = imread('lena.tif');
       I1=imnoise(I,'gaussian',0,0.01);
      figure,imshow(I1);title('含高斯噪声图像')
       J=filter2(fspecial('average',5),I1)/255;
       figure,imshow(J);title('均值滤波后图像')
     
 %   (2)．邻域加权平均平滑低通滤波滤除高斯噪声

  clear all;
  clc;
  I = imread('lena.tif');
  I1=imnoise(I,'gaussian',0,0.01);
 figure,imshow(I1);title('含高斯噪声图像')
  J=filter2(fspecial('gaussian',5,2),I1)/255;
 figure,imshow(J);title('邻域加权平均平滑低通滤波')

% 3.中值滤波滤除椒盐噪声
% 在matlab环境中，程序首先读取图像，然后调用图像增强（中值滤波）函数，设置相关参数，再输出处理后的图像。
% (1). 中值滤波滤除椒盐噪声,滤波窗口为3×3。

         clear all;
         clc;
        I = imread('lena.tif');
        I1 = imnoise(I,'salt & pepper',0.02);
        figure,imshow(I1);title('含椒盐噪声图像')
        J=medfilt2(I,[3,3]);
        figure,imshow(J);title('中值滤波后图像')
  
% (2). 中值滤波滤除椒盐噪声,滤波窗口为5×5。

        clear all;
        clc;
        I = imread('lena.tif');
        I1 = imnoise(I,'salt & pepper',0.02);
        figure,imshow(I1);title('含椒盐噪声图像')
        J=medfilt2(I,[5,5]);
        figure,imshow(J);title('中值滤波后图像')

% 4．对加了高斯噪声的图像进行邻域均值滤波和中值滤波，比较滤波效果。

        clear all;
         clc;
       I=imread('lena.tif'); 
       J = imnoise(I,'gauss',0.02);                    %添加高斯噪声 
       K = filter2(fspecial('average',3),J)/255;   %均值滤波模板大小3×3
       L = filter2(fspecial('average',5),J)/255;   %均值滤波模板大小 5×5
       M = medfilt2(J,[3 3]);                %中值滤波窗口大小为3×3 
       N = medfilt2(J,[5 5]);                % 中值滤波窗口大小为5×5 
       subplot(2,3,1);imshow(I);title('原图')
       subplot(2,3,2);imshow(J);title('加高斯噪声')
       subplot(2,3,3);imshow(K);title('均值滤波 3×3输出图')
       subplot(2,3,4);imshow(L);title('均值滤波 5×5输出图')
       subplot(2,3,5);imshow(M);title('中值滤波3×3输出图')
       subplot(2,3,6);imshow(N);title('中值滤波5×5输出图')
     
% 5．对加了椒盐噪声的图像进行均值滤波和中值滤波，比较滤波效果。

       clear all;
       clc;
       I=imread('lena.tif'); 
       J = imnoise(I,'salt & pepper',0.02);          %添加椒盐噪声
       K = filter2(fspecial('average',3),J)/255;       %均值滤波模板大小3×3
       L = filter2(fspecial('average',5),J)/255;       %均值滤波模板大小5×5
       M = medfilt2(J,[3 3]);               %中值滤波窗口大小3×3
       N = medfilt2(J,[5 5]);               %中值滤波窗口大小5×5
       subplot(2,3,1);imshow(I);title('原图')
       subplot(2,3,2);imshow(J);title('加椒盐噪声')
       subplot(2,3,3);imshow(K);title('均值滤波 3×3输出图')
       subplot(2,3,4);imshow(L);title('均值滤波 5×5输出图')
       subplot(2,3,5);imshow(M);title('中值滤波3×3输出图')
       subplot(2,3,6);imshow(N);title('中值滤波5×5 输出图')
