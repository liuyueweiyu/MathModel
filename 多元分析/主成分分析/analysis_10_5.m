clc,clear
data = load('data1.txt');
[m,n] = size(data);
x0 = data(:,[1:n-1]);
y0 = data(:,n);
hg1 = [ones(m,1),x0]\y0;%计算普通最小二乘法回归系数
hg1 = hg1';%变成行向量显示回归系数，其中第一个分量是常数项，其他按X1,...,Xn排序
fprintf('y = %f',hg1(1));%开始显示普通最小二乘法回归结果
for i=2:n
    if hg1(i) > 0
        fprintf('+%f*x%d',hg1(i),i-1);
    else
        fprintf('%f*x%d',hg1(i),i-1);
    end
end
fprintf('\n\n');
r = corrcoef(x0);%计算相关系数矩阵
xd = zscore(x0);%标准化处理
yd = zscore(y0);
[vec1,lamda,rate] = pcacov(r); %vec1为r的特征向量，lamda为特征值，rate为各个主成分的贡献率
f = repmat(sign(sum(vec1)),size(vec1,1),1);%构造与vec1同维数的元素为正负1的矩阵
vec2 = vec1.*f ;%修改特征向量的正负号，使得特征向量所有分量和为正
contr = cumsum(rate); %计算累积贡献率，第i个分量表示前i个主成分的贡献率
df = xd * vec2;%计算所有主成分的得分
num = 3;
% num = input('请选择主成分的个数:');%通过累积贡献率交互式选择主成分的个数
hg21 = df(:,[1:num])\yd %主成分变量的回归系数，这里由于数据标准化，回归方程的常数项为0
hg22 = vec2(:,1:num)*hg21%标准化变量的回归系数方程
hg23 = [mean(y0)-std(y0)*mean(x0)./std(x0)*hg22,std(y0)*hg22'./std(x0)];%计算原始变量回归方程系数
fprintf('y=%f',hg23(1));%开始显示主成分回归结果
for i=2:n
    if hg23(i) > 0
        fprintf('+%f * x%d',hg23(i),i-1);
    else
        fprintf('%f * x%d',hg23(i),i-1);
    end
end
fprintf('\n');
rese1 = sqrt(sum((hg1(1)+x0*hg1(2:end)')-y0).^2/(m-n));%拟合n个参数
rese2 = sqrt(sum((hg1(1)+x0*hg23(2:end)')-y0).^2/(m-num));%拟合num个参数