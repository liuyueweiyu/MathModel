clc,clear
x0 = [0 3 5 7 9 11 12 13 14 15];
y0 = [0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6];

x = 0:0.1:15;   %插值的横坐标
y1 = interp1(x0,y0,x);  %以x0和y0为基础 线性插值
y2 = interp1(x0,y0,x,'spline');%以x0和y0为基础 立方样条插值
pp1 = csape(x0,y0);%是由根据己知的x，y数据，求出它的样条函数表达式，不过该表达式不是用矩阵直接表示，
y3 = fnval(pp1,x);%要求点x`的值，要用函数y`=ppval(pp,x`);

%  'complete'：给定边界一阶导数,即默认的边界条件,Lagrange边界条件 
%  'not-a-knot'：非扭结条件,不用给边界值. 
%  'periodic'：周期性边界条件,不用给边界值. 
%  'second'：给定边界二阶导数.  
%  'variational'：自然样条(边界二阶导数为[0,0]
pp2 = csape(x0,y0,'second');
y4 = fnval(pp2,x);

[x',y1',y2',y3',y4'];

% subplot(1,3,1)
% plot(x0,y0,'+',x,y1)
% title('Piecewise linear')
% 
% subplot(1,3,2);
% plot(x0,y0,'+',x,y2);
% title('Spline1');
% 
% subplot(1,3,3);
% plot(x0,y0,'+',x,y3);
% title('Spline2');

dx = diff(x);
dy = diff(y3);
dy_dx = dy ./ dx;
dy_dx0 = dy_dx(1);
ytemp = y3(131:151);
ymin = min(ytemp);
index = find(y3 == ymin);
xmin = x(index);
[xmin,ymin]
