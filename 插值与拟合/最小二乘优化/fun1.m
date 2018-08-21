function f = fun1(canshu,xdata);
%其中canshu(1)为k1,canshu(2)为k2
f = exp(-canshu(1)*xdata(:,1)).*sin(canshu(2)*xdata(:,2))+xdata(:,3).^2;