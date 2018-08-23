%没看懂 = =！
clc,clear;
n = 100;
f = 0:7;
num = [36 40 19 2 0 2 1 0];
lamda = dot(f,num)/n;
pi = poisspdf(f,lamda);
[h,p,st] = chi2gof(f,'ctrs',f,'frequency',num,'expected',n*pi,'nparams',1)%调用工具箱
col3 = st.E/sum(st.O);
col4 = st.E;
col5 = st.O.^2./col4;
sumcol5 = sum(col5);
k2 = chi2inv(0.95,st.df)

