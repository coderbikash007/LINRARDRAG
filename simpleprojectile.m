function simpleprojectile(vo,thetao)
g=9.8;
T=2*vo*sind(thetao)/g;
t=linspace(0,T,1000);
vx=vo*cosd(thetao);
vy=vo*sind(thetao);
x=vx.*t;
y=vy.*t-1/2*g*t.^2;
% animation
for i=1:length(t)
    clf; %clearing current figure
    plot(x(1:i),y(1:i),'r:o');
    axis([min(x) max(x) min(y) max(y)]);
    pause(0.01) % for interval
end

%command window simpleprojectile(100,30)