clc,clear
x0 = [1050 1100 1120 1250 1280];
alpha = 0.05;
n = length(x0);
ta = tinv(1-alpha/2,n-1);
xb = mean(x0);
s = std(x0);
mu = xb - s/sqrt(n) * ta
[h,p,ci] = ttest(x0,xb,'Alpha',0.05,'Tail','right');