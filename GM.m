%close all;
clear;
clc;

n=100;
A=zeros(n);
A=floor(rand(n)*5);
%A=floor(rand(100)*5);
 A(A>0)=1;
 A=A+1;A(A==2)=0;

A= mat2gray(A);

% convert to binary--> % states={0,1}
%A=imbinarize(A);
% visualize the initial states 
%disp('the binary image')
%figure(1);
imshow(A);

A=Bnd(A,0); 
[d1,d2]=size(A);
disp('the extended binary image');

whos A;
imshow(A);
pause
B=A;
t=0;
stp=false; % to stop when if no new configrations
%B is the CA in time t
%A is the CA in time t+1
%t is the number of generations 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Play ^_^
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while ~stp & (t<10) % repeat for 10 generations
    % for each cell in the CA 
    for i=2:d1-1
        for j=2:d2-1           
            % apply Game of life rule     
            A(i,j)=GOL(A,B,i,j);
        end
    end 
    % visualize what happened
    disp('the CA image');
    imshow(A);    
    drawnow;
%    pause
    % save B 
    if A==B
       stp=true; % no more new states
    end
    B=A;  
    t=t+1;  
end  