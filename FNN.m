function [Acc] = FNN(X,Y,k)


if nargin==0
%  X=[1  2; 5 6; 3 4;7 -4;34 -20];  
%  Y=[8 14;3  24; 10 15;14 -17;-62 6];
X=[17.5000  576.2000; 35.9000  598.6000]; 
Y=[57.6000  848.0000; 24.8000  905.0000]; 
k=2;

elseif nargin==2
k=size(X,1);

end

X=X(1:k,:)/1000; 
X=[ones(size(X,1),1) X];
Y=Y(1:k,:)/1000;

ni = size(X,2);
nh = 3;
no = size(Y,2);
N=200000;

% a=zeros(size(X,1),nh);
Z=zeros(size(Y));


W1=0.0025*rand(nh,ni);
Wo=5*rand(no,nh+1);
% W1=[1.019165966126373,-0.012309363730452;32.093452849245050,-0.503837590655945];

alpha = 0.01;

Acc=sum(abs(Y-Z))/k;
i=0;
while (sum(Acc)>0.01)% (abs(Y-Z)>((10^-1)*ones(size(Y))))
    z = (X*W1');
    a = 2*logsig(z)-1;
    a = [ones(size(a,1),1) a];
    Z = (a*Wo');%poslin
    e=(Y-Z);
    hiddenDelta =  (2*a(:,2:end).*(1-a(:,2:end))).*(e*Wo(:,2:end));%
    Wo = Wo + alpha*((e')*a)/k;
    W1 = W1 + alpha*(((hiddenDelta)')*X)/k;
    i=i+1;
    if i>N
        break;
    end
Acc=sum(abs(Y-Z))/k;
disp([i, Acc]);
end

A=[X Y Z]*1000;

end