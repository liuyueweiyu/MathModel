% Q-Q图——检验拟合优度
% 存疑
clc,clear
a = textread('data1.txt');
a = nonzeros(a);
xbar = mean(a);%平均数
s = std(a);%标准差
% pd = normpdf(min(a):0.01:max(a),xbar,s)
pd = ProbDistUnivParam('normal',[xbar s]);%定义正态分布
qqplot(a,pd);