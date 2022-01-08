clear all;
syms t x(t);
m=2;
k=25.6/0.7;
dx = diff(x,t);
ddx = diff(x,t,2);
 
c=40;
sol(t) = dsolve(m*ddx+c*dx+k*x == 0, [x(0) == 0, dx(0) == 0.6]);
figure;
plot(0:0.01:10, sol(0:0.01:10));

c=4;
sol(t) = dsolve(m*ddx+c*dx+k*x == 0, [x(0) == 0, dx(0) == 0.6]);
figure;
plot(0:0.01:10, sol(0:0.01:10));
 
c=40;
figure;
sol = ode45(@(t,x)([ x(2); (-c*x(2)-k*x(1))/m ]), [0 10], [0 0.6]);
plot(sol.x, sol.y(1,:));
 
c=4;
figure;
sol = ode45(@(t,x)([ x(2); (-c*x(2)-k*x(1))/m ]), [0 10], [0 0.6]);
plot(sol.x, sol.y(1,:));
