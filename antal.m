function antal=raeknagrannar(V,i,j,n)
igrannar=max(1,i-1):min(n,i+1);
jgrannar=max(1,j-1):min(n,j+1);
antal=sum(sum(V(igrannar,jgrannar)))-V(i,j);
end