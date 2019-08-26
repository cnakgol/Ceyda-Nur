function A = createA(data,N,M)
%CREATEA creates the N+M by N+M matrix A, according to the Modified Node
%Analysis, by creating G, B, C, and D matrices.
G=zeros(N,N);
dataArray=cell2mat(data{1,1});
R=0;
resistance=[];
node1=[];
node2=[];
for i=1:length(dataArray)
    if dataArray(i,1)=='R'
       R=R+1; 
       node1=[node1 data{1,2}(i)];
       node2=[node2 data{1,3}(i)];
       resistance=[double(resistance) data{1,4}(i)];
    end
end

for i=1:R
    for j=1:N
        if node1(i)==j || node2(i)==j
            if G(j,j)~=0
                G(j,j)=(G(j,j)+1/double(resistance(i)));
            else
                G(j,j)=1/double(resistance(i));
            end
        end
    end
end

for i=1:R
    for j=1:N
        for k=1:N
            if node1(i)==j && node2(i)==k
                if G(j,k)~=0 && G(k,j)~=0
                    G(j,k)=G(j,k)-1/double(resistance(i));
                    G(k,j)=G(k,j)-1/double(resistance(i));
                elseif G(j,k)==0 && G(k,j)~=0
                    G(j,k)=-1/double(resistance(i));
                    G(k,j)=G(k,j)-1/double(resistance(i));
                elseif G(j,k)~=0 && G(k,j)==0
                    G(j,k)=G(j,k)-1/double(resistance(i));
                    G(k,j)=-1/double(resistance(i));
                else
                    G(j,k)=-1/double(resistance(i));
                    G(k,j)=-1/double(resistance(i));
                end
            end
        end
    end
end

B=zeros(N,M);
voltages=[];
node1=[];
node2=[];
for i=1:length(dataArray)
    if dataArray(i,1)=='V'
        node1=[node1 data{1,2}(i)];
        node2=[node2 data{1,3}(i)];
        voltages=[voltages data{1,4}(i)];
    end
end

for i=1:length(voltages)
    if voltages(i)>0 
        if node1(i)~=0
            B(node1(i),i)=-1;
            B(node2(i),i)=1;
        elseif node1(i)==0
            B(node2(i),i)=1;
        end
    else
        if node1(i)~=0
            B(node1(i),i)=1;
            B(node2(i),i)=-1;
        elseif node1(i)==0
            B(node2(i),i)=-1;
        end
    end
end

C=transpose(B);
D=zeros(M,M);
A=[G B;C D];
end