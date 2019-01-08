close all;
clear;
clc;


%For random starting pattern, 100x100 matrix
% n=100;
% A=zeros(n); %A = starting matrix
% A=floor(rand(n)*5);
% A(A>0)=1;
% A=A+1;A(A==2)=0;
% A=imbinarize(A);
% visualize the initial states

%Starting input
A=zeros(11,38);
A([6:7],[2:3])=1;
A([4:5],[36:37])=1;
A([6:8],[12,18])=1;
A([5,9],[13,17])=1;
A([4,10],[14:15])=1;
A([7],[16,19])=1;
A([4:6],[22:23])=1;
A([3,7],[24])=1;
A([2:3,7:8],[26])=1;

A=boundary1(A,0); 
[d1,d2]=size(A);

B=A;
figure(1)
pcolor(~B);

t=0;
stp=false; % to stop when if no new configurations
%B is the CA in time t
%A is the CA in time t+1

%%%%%%%%%%%% 
%   Play   %
%%%%%%%%%%%%

 
video = VideoWriter('Population utveckling.avi');
open(video);
    while ~stp && (t<500) %t is the number of generations
    % repeat for (t<N) generations for each cell  
    B2=B;    
    for i=2:d1-1
        for j=2:d2-1               
            B2(i,j)=rule1(B,i,j);% apply rules
        end
    end
    
    B=B2;
    % visualize what happened
    figure(2)
    pcolor(~B);
    title('Population utveckling'); 
    drawnow; 
    if A==B
       stp=true; % no more new states
    end 
    A=B;    
    t=t+1;
    F = getframe(gcf); 
    writeVideo(video,F);
    end
    close(video);
