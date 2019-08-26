function X = createX(data,N,M)
%CREATEX creates the N+M by 1 matrix X, according to the Modified Node
%Analysis, by creating v and j matrices.
v=[];
for i=1:N
    x=compose("V_%d",i);
    v=[v x];
end
v=v';

j=[];
dataArray=cell2mat(data{1,1});
for i=1:M
    if dataArray(i,1)=='V'
        y=compose("I_%s",dataArray(i,:));
        j=[j y];
    end
end
j=j';
X=[v;j];
end

