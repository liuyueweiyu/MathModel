%聚类分析
clc,clear
gj = load('data3.txt');
gj(:,[3:6]) = [];%删除3-6列，即只使用变量1,2,3,8,9,10
b = zscore(gj);%矩阵标准化
y = pdist(gj);%求对象的欧式距离，每一行都是一个对象
z = linkage(y,'average');%按类平均法聚类
h = dendrogram(z);%画聚类图
set(h,'Color','k','LineWidth',1.3);
T = cluster(z,'maxclust',6);%把对象分为3类
for k=3:5
    fprintf('划分成%d类的结果如下:\n',k);
    T = cluster(z,'maxclust',k);%把样本点划分成k类
    for i = 1:k
        tm = find(T == i);%求第i类的对象
        tm = reshape(tm,1,length(tm));%变成第i类对象
        fprintf('第%d类的有%s\n',i,int2str(tm));%显示分类结果
    end
    if k == 5
        break
    end
    fprintf('****************************************\n');
end