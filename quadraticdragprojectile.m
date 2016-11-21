function quadraticdragprojectile(vo,thetao,Dq,m)
g=9.8;
c=[0;1/2;1/2;1];
a=[0 0 0 0;1/2 0 0 0;0 1/2 0 0;0 0 1 0];
w=[1/6 1/3 1/3 1/6];
vox=vo*cosd(thetao);
voy=vo*sind(thetao);
s(:,1)=[0; 0; vox; voy]; %initialization
t(1)=0; %intial time
F=@(t,s)[s(3); s(4); -Dq/m*s(3)*sqrt(s(3)^2+s(4)^2);-g-Dq/m*s(4)*sqrt(s(3)^2+s(4)^2)];
i=1; %initialization of counter
h=0.01;
while s(2,i)>=0
    k=zeros(length(s(:,1)),length(c));%initialization of k values
    for j=1:length(c)                              
        k(:,j)=h*F(t(i)+c(j)*h,s(:,i)+k*a(j,:)');
    end
    s(:,i+1)=s(:,i)+k*w';
    t(i+1)=t(i)+h; %updating time
    i=i+1; %updating counter
end
% plot(s(1,:),s(2,:));
% animation
for i=1:length(t)
    clf; %clearing current figure
    plot(s(1,1:i),s(2,1:i),'r:o')
    %plot(s(1,i),s(2,i),'r:o');
    axis([min(s(1,:)) max(s(1,:)) min(s(2,:)) max(s(2,:))]);
    pause(0.01) % for interval
end
%command window  quadraticdragprojectile(100,30,0.005,1)