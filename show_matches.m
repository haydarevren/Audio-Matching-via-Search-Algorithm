function show_matches (Q,FILES,TRESHOLD)

R=match_query(Q);

n=size(R,1);
if sum(R(:,2)>TRESHOLD)==0
        disp(['No match found!']);
else
for i=1:n;
    if R(i,2)>TRESHOLD;
        disp(['Match#',num2str(i),'  ',FILES{R(i,1)}]);
    end
end
end
