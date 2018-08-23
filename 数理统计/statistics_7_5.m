clc,clear
a = textread('data1.txt');
a = nonzeros(a);
[ycdf,xcdf,n] = cdfcalc(a);
cdfplot(a);
title('');
hold on,plot(xcdf,ycdf(2:end),'.')
xlswrite('test.xls',[xcdf,ycdf(2:end)])
