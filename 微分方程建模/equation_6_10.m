clc,clear
rho = 10;
beta = 28;
lamda = 8/3;
f = @(t,Y) [
    rho*(Y(2)-Y(1))
    beta*Y(1)-Y(2)-Y(1)*Y(3)
    -lamda*Y(3)+Y(1)*Y(2)
];
[t,y] = ode45(f,[0,30],[5,13,17]);
subplot(2,2,1);
plot(t,y(:,1),'*');
subplot(2,2,2);
plot(t,y(:,2),'X');
subplot(2,2,3);
plot(t,y(:,3),'o');
subplot(2,2,2);
plot3(y(:,1),y(:,2),y(:,3));
