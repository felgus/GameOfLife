function s=rule1(B,i,j)
% game of life rule
sm=0;
% count number of alive neighbors
sm=sm+ B(i-1,j-1)+B(i-1,j)+B(i-1,j+1);
sm=sm+ B(i,j-1)+           B(i,j+1);
sm=sm+ B(i+1,j-1)+B(i+1,j)+B(i+1,j+1);
% compute the new state of the current cell
s=B(i,j);
if B(i,j)==1 % around all alive cell
    if (sm>=3)&(sm<=4) % sum of alive neighbour cells are 2 or 3
        s=1; % the cell then is alive
    else
        s=0 ; % otherwise the cell dies  
    end
else
    if sm==3 % sum of alive neighbours are exact 3
       s=1; % the cell is alive
    end
end
end
    