function satellite(vo,thetao,H,tmax)
c=[0;1/2;1/2;1];
a=[0 0 0 0;1/2 0 0 0;0 1/2 0 0;0 0 1 0];
w=[1/6 1/3 1/3 1/6];
GM=4e14*1e-9*3600^2;%km-hr
Re=6400%in km
Fx=@(t,s)-GM/(s(1)^2+s(3)^2)^(3/2)*s(1);
Fy=@(t,s)-GM/(s(1)^2+s(3)^2)^(3/2)*s(3);
F=@(t,s)[s(2);Fx(t,s);s(4);Fy(t,s)];
vox=vo*cosd(thetao);
voy=vo*sind(thetao);
s(:,1)=[0; vox; Re+H; voy]; %initialization
t(1)=0; %intial time at hr
i=1; %initialization of centre for iteration
dt=0.01; %at hr
while s(1,i)^2+s(3,i)^2>=Re^2&&t(i)<tmax
    k=zeros(length(s(:,1)),length(c));%initialization of k values
    for j=1:length(c)                              
        k(:,j)=dt*F(t(i)+c(j)*dt,s(:,i)+k*a(j,:)');
    end
    s(:,i+1)=s(:,i)+k*w';
    t(i+1)=t(i)+dt; %updating time
    i=i+1; %updating counter
end
thetae=0:360
xe=Re*cosd(thetae);
ye=Re*sind(thetae);

%plot(s(1,:),s(3,:));
%hold on;
%plot(xe,ye,'r');
%hold off;
    
% animation
for i=1:length(t)
    clf; %clearing current figure
    hold on;
    %plot(s(1,1:i),s(3,1:i),'b:o')
    plot(s(1,i),s(3,i),'b:o');
    plot(xe,ye,'r')
    axis([min(s(1,:)) max(s(1,:)) min(s(3,:)) max(s(3,:))]);
    pause(0.01) % for interval
    hold off;
end
% command window  satellite(27600, 0, 400, 10) :for simple orbiting
% satellite(30000, 7, 400, 15) :more eleptical orbit
% satellite(30000, 175, 1000, 15) :more eleptical orbit
%  satellite(35000, 7.5, 400, 15) :more eleptical orbit
%  satellite(35000, 4, 400, 15) :more eleptical orbit
% satellite(38000, 10, 400, 50) :more eleptical orbit
%  satellite(40000, 4, 400, 25) :escaping satellite
%  satellite(30000, 9, 400, 15) :incomplte orbiting
%  satellite(30000, 15, 400, 15) :incomplete orbiting
% satellite(30000, 80, 400, 15) :projectile motion
% satellite(30000, 89.9, 400, 15) :projectile motion
% satellite(30000, 91.1, 400, 15) :projectile motion
% satellite(30000, 170, 400, 15) :incompleting orbiting
% satellite(30000, 175, 400, 15) :complete orbiting
% satellite(30000, 175, 2000, 15)
% satellite(30000, 175, 3000, 15)
% satellite(30000, 5, 3000, 15)