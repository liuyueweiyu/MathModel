clc,clear
a = textread('data1.txt');
y0 = a(:,[2,7]);%提出因变量的y
y0 = nonzeros(y0);%去掉最后的0元素并且变成列向量
x0 = [a(:,[3:5]);a([1:end-1],[8:10])]; %提出因变量的x,并变成列向量
canshu0 = rand(2,1);
lb = zeros(2,1);
ub = [20;2];
canshu = lsqcurvefit(@fun1,canshu0,x0,y0,lb,ub);
