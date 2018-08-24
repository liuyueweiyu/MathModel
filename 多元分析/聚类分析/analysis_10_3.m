%聚类分析
clc,clear
a = load('data2.txt');
b = zscore(a);%矩阵标准化
r = corrcoef(b)%计算相关系数矩阵
%d = tril(1-r);d = nonzeros(d)';%另一种计算距离的方式
d = pdist(b','correlation');%计算相关系数导出距离
z = linkage(d,'average');%按类平均法聚类
h = dendrogram(z);%画聚类图
set(h,'Color','k','LineWidth',1.3);
T = cluster(z,'maxclust',6);%把对象分为3类
for i=1:6
    tm = find(T == i);%求第i类的对象
    tm = reshape(tm,1,length(tm));%变成第i类对象
    fprintf('第%d类的有%s\n',i,int2str(tm));%显示分类结果
end