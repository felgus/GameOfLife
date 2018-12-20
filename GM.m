%close all;
clear;
clc;

n=100;
A=zeros(n);
A=floor(rand(n)*5);
A=floor(rand(100)*5);
 A(A>0)=1;
 A=A+1;A(A==2)=0;

%A = starting matrix

%Jellyfish pattern
% A=zeros(170);
% A([50:70,110:130],[30,80,100,150])=1;
% A([30,80,100,150],[50:70,110:130])=1;

%Glider pattern
% A=zeros(110,380);
% A([60:70],[20:30])=1;
% A([40:50],[360:370])=1;
% A([60:80],[120,180])=1;
% A([50,90],[130,170])=1;
% A([40,100],[140:150])=1;
% A([70],[160,190])=1;
% A([40:60],[220:230])=1;
% A([30,70],[240])=1;
% A([20:30,70:80],[260])=1;


A= mat2gray(A);

% convert to binary--> % states={0,1}
%A=imbinarize(A);
% visualize the initial states 
%disp('the binary image')
%figure(1);
imshow(A);


A=boundary1(A,0); 
[d1,d2]=size(A);
%disp('the extended binary image');

whos A;
imshow(A);
pause
B=A;
t=0;
stp=false; % to stop when if no new configurations
%B is the CA in time t
%A is the CA in time t+1
%t is the number of generations 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Play ^_^
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while ~stp & (t<100) % repeat for (t<N) generations
    % for each cell 
    B2=B;
    for i=2:d1-1
        for j=2:d2-1           
            % apply rules     
            B2(i,j)=GOL(B,i,j);
        end
    end 
    B=B2;
    % visualize what happened
    %disp('the CA image');
    imshow(~B);    
    drawnow;
%    pause
    % save B 
    if A==B
       stp=true; % no more new states
    end
    A=B;
      
    t=t+1;
    
end  