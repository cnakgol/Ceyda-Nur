function data = readFile(fileName)
%READF�LE reads the data from the text file
fID=fopen(fileName,'r');
data=textscan(fID,'%s %d %d %f');
fclose(fID);
end
