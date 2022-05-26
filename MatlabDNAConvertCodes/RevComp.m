function Vec=RevComp(Vec)
L=length(Vec);
for i=1:L
    if (Vec(i)=='A')
        Vec(i)='T';
    elseif (Vec(i)=='T')
        Vec(i)='A';
    elseif (Vec(i)=='G')
        Vec(i)='C';
    elseif (Vec(i)=='C')
        Vec(i)='G';
    end     
end
Vec=reverse(Vec);
end