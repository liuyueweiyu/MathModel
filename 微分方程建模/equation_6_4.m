%求解线性常微分方程组----1阶
clc,clear
syms x(t) y(t) z(t)
X = [x;y;z];
A = [2 1 3;0 2 -1;0 0 2];
B = [1 2 1]';
[x,y,z] = dsolve(diff(X) == A*X,X(0)==B)