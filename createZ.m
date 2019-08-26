function Z = createZ(data,N,M)
%CREATEZ creates the N+M by 1 matrix Z, according to the Modified Node
%Analysis, by creating i and e matrices.
dataArray=cell2mat(data{1,1});
i=zeros(N,1);
for j=1:length(dataArray)
    if dataArray(j,1)=='I'
        i(data{1,3}(j),1)=double(data{1,4}(j));
        if data{1,2}(j)~=0
            i(data{1,2}(j),1)=double(-data{1,4}(j));
        end
    end
end
e=zeros(M,1);
voltageData=[];
for j=1:length(dataArray)
    if dataArray(j,1)=='V'
        voltageData=[voltageData double(data{1,4}(j))];
    end
end

for j=1:length(voltageData)
    e(j,1)=double(voltageData(j));
end

Z=[i;e];
end

