function displayResults(result)
%DÝSPLAYRESULTS displays the result in a suitable way.
for i=1:length(result)
    fprintf('V%d=%f\n',i,result(i));
end

