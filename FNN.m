function [Acc] = FNN(X,Y,k)


if nargin==0
X=[1  2; 5 6; 3 4];  
Y=[3 8; 14 24; 10 15];
% X=[17.5000  576.2000; 35.9000  598.6000]; 
% Y=[57.6000  848.0000; 24.8000  905.0000]; 
k=2;
end

X=X(1:k,:); 
Y=Y(1:k,:);

ni = size(X,2);
nh = 2;
no = size(Y,2);
N=150000;

Z=zeros(size(Y));
% y=zeros(length(X),no);

W1=rand(nh,ni);
% W1=[1.019165966126373,-0.012309363730452;32.093452849245050,-0.503837590655945];
% Wo=ones(nh,no);
alpha = 0.01;%0.0000001;

Acc=sum(abs(Y-Z));
i=0;
while (sum(Acc)>.1) % (abs(Y-Z)>((10^-1)*ones(size(Y))))
    Z = ((X*W1'));%poslin
%     y = (Z*Wo);
%     Wo = Wo + alpha*Z*(Y-y);
    W1 = W1 + alpha*(((Y-Z)')*X);
    i=i+1;
    if i>N
        break;
    end
Acc=sum(abs(Y-Z));
disp([i, Acc]);
end

A=[X Y Z];

end