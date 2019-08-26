function [N, M] = findNandM(data)
%FÝNDNANDM finds # of nodes (N) and # of independent voltage sources (M)
N=max(data{1,3});
dataArray=cell2mat(data{1,1});
M=0;
for i=1:length(dataArray)
    if dataArray(i,1)=='V'
        M=M+1;
    end
end

end

