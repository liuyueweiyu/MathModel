%即 svmtrain 训练支持向量机，再 svmclassify 分类
clc,clear
a0 = load('data1.txt');
a = a0';
b0 = a(:,[1:27]);%提取已分类数据
dd0 = a(:,[28:end]);%提取待分类数据
[b,ps] = mapstd(b0);%已分类数据标准化
dd = mapstd('apply',dd0,ps);%待分类数据标准化
group = [ones(20,1);2*ones(7,1)];%已知样本点的类别标号
s = svmtrain(b',group) %训练支持向量机
% sv_index = s.SupportVectorIndices;%返回支持向量的标号
% beta = s.Alpha; %返回分类函数的权系数
% bb = s.Bias;%返回分类函数的常数项
% mea_and_std_trans = s.ScaleData;%第一行返回的是已知样本点均值向量的相反数，第2行返回的是标准差向量的倒数
check = svmclassify(s,b');%验证已知样本点
err_rata = 1 - sum(group == check)/length(group);%计算错判率
soluruib = svmclassify(s,dd') %对待判样本点分类