%线性回归
clc,clear
ab = textread('data2.txt');
Y = ab(:,[2:5:10]); Y = nonzeros(Y);
ab([1:12],[8:10]);
x123 = [ab([1:13],[3:5]);ab([1:12],[8:10])];
X = [ones(25,1),x123];
%beta——回归系数，betaint——回归系数的区间估计，r——残差，rint——置信区间
%st——用于检验回归模型的统计量。有4个数值：判定系数R^2，F统计量观测值，检验的p的值，误差方差的估计
[beta,betaint,r,rint,st] = regress(Y,X);

% q = sum(r.^2);
% ybar =mean(Y)
