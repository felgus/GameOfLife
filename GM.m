close all;
clear;
clc;


%For random starting pattern, 100x100 matrix
%n=29;
% A=zeros(n); %A = starting matrix
% A=floor(rand(n)*5);
% A(A>0)=1;
% A=A+1;A(A==2)=0;
% A=imbinarize(A);
% visualize the initial states

%Starting input
A=zeros(18);
A(5:7,[7,12])=1;
A(8,5:14)=1;
A(9,[4,6,13,15])=1;
A(10,[8,11])=1;
A(11,[3:4,9:10,15:16])=1;
A([12,14],[2:4,15:17])=1;
A(13,[2,4,15,17])=1;



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

 
video = VideoWriter('Game of Crabs.avi');
%video.FrameRate = 15;
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
    title('Le Crabe'); 
    drawnow; 
    if A==B
       stp=true; % no more new states
    end 
    A=B;    
    t=t+1;
    F = getframe(gcf); 
    pause();
    writeVideo(video,F);
   
    end
    close(video);
