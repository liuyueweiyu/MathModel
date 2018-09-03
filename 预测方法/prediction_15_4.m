clc,clear
x0=[2.874,3.278,3.39,3.679,3.77,3.8]; %原始数据序列
n=length(x0);
a_x0=diff(x0)';  %求1次累减序列，即1阶向前差分
B= [-x0(2:end)',ones(n-1,1)]
u = B\a_x0 %最小乘法拟合参数
syms x(t)
x = dsolve(diff(x)+u(1)*x == u(2)*x^2,x(0) == x0(1)) %求符号解
xt = vpa(x,6)
yuce = subs(x,'t',[0:n-1]) %求已知数据点1次累加序列的预测值
x0_hat = [yuce(1),diff(yuce)] %求已知数据点的预测值
epsilon = x0 - x0_hat %求残差
delta - abs(epsilon./x0) %求相对误差