clc,clear
data = load('data2.txt');
data = zscore(data);%数据标准化
r = corrcoef(data) %计算相关系数矩阵
%下面利用相关系数矩阵进行主成分分析,x的列为r的特征向量，即主成分的系数
[x,y,z] = pcacov(r)%y为r的特征值,z为各个主成分的贡献率
f = repmat(sign(sum(x)),size(x,1),1)%构造同维度的正负一矩阵
x = x.*f %修改特征向量的正负号,每个特征向量乘以所有的分类和符号函数数值
num = 3;%num为选取的主成分个数
df = data*x(:,[1:num]) %计算各个主成分的得分
tf = df*z(1:num)/100 %计算综合得分
[stf,ind] = sort(tf,'descend') %按照得分排序
stf = stf';
ind = ind';