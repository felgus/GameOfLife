
function GameOfLife_CTH;
clear;
close all;
clc;


n = 10;

figure(1), clf
fill([1 n+1 n+1 1],[1 1 n+1 n+1],'w')
axis equal, axis([1 n+1 1 n+1])
hold on
for k=1:n+1
    plot([1 n+1],[k k],'k')
    plot([k k],[1 n+1],'k')
end

V = zeros(n,n);

while 1
    [i,j,Knapp]=ginput(1);
    i=floor(i); j=floor(j);
    if Knapp==1
    V(i,j)=1;
    fill([i i+1 i+1 i],[j j j+1 j+1],'k')
else
     break
    end
end
end

% antal=sum(sum(V(i-1:i+1,j-1:j+1)))-V(i,j);
% 
% igrannar=max(1,i-1):min(n,i+1);
% jgrannar=max(1,j-1):min(n,j+1);
