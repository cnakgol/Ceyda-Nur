function [nodeVoltages]= findNodeVoltages(fileName)
%FÝNDNODEVOLTAGES finds all the node voltages according to the Modified
%Node Analysis by using subsidary functions.
data=readFile(fileName);
[N,M]=findNandM(data);
A=createA(data,N,M);
Z=createZ(data,N,M);
X=double(A\Z);
nodeVoltages(1:N)=X(1:N);
end

