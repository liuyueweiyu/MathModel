%聚类分析
clc,clear
a =  textread('data1.txt');
d = 1 - abs(a);%进行数据变换，把相关系数转化为距离
d = tril(d);%下三角阵
b = nonzeros(d);%去0变成列向量
b = b';
z = linkage(b,'complete');%按最大距离法聚类
y = cluster(z,'maxclust',2);%分成两类
ind1 = find(y == 1);ind1 = ind1'
ind2 = find(y == 2);ind2 = ind2'
h = dendrogram(z);%画聚类图
set(h,'Color','k','LineWidth',1.3);

