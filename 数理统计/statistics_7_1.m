clc,clear
x0 = [506 508 499 503 504 510 497 512 514 505 493 496 506 502 509 496]';
alpha = 0.05;
mu = mean(x0);%平均值
sig = std(x0);%标准差
n = length(x0);
t = [mu - sig/sqrt(n)*tinv(1-alpha/2,n-1),mu+sig/sqrt(n)*tinv(1-alpha/2,n-1)];
%也可以用这种方式求置信空间
[h,p,ci] = ttest(x0,mu,0.05);



