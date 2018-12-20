function bA= Bnd(A,k)
% add new four vectors based on boundary type
[d1, d2]=size(A);
d1=d1+2; d2=d2+2;
X=ones(d1,d2);
X=im2bw(X);
X(2:d1-1,2:d2-1)=A;
imshow(X);
whos A X
if k==0 % Reflection
   X(  1  , 2:d2-1)=A(end , :);
   X(  d1 , 2:d2-1)=A( 1  , :);
   X( 2:d1-1 , 1  )=A(: , end);
   X( 2:d1-1 , d2 )=A(: ,  1 );
   
   X(1,1)    =A(end,end);
   X(1,end)  =A(end,1);
   X(end,1)  =A(1,end);
   X(end,end)=A(1,1);    
elseif k==1 % Double
   X(  1  , 2:d2-1)=A( 1  , :);
   X(  d1 , 2:d2-1)=A(end , :);
   X( 2:d1-1 , 1  )=A(: ,  1 );
   X( 2:d1-1 , d2 )=A(: , end);
   
   X(1,1)    =A(end,1);
   X(1,end)  =A(end,end);
   X(end,1)  =A(1,1);
   X(end,end)=A(1,end);

elseif  k==2 % zeros
   X(  1  ,:)=0;
   X( end ,:)=0;
   X(: ,  1  )=0;
   X(: , end )=0;
end
bA=X;