%Function that takes in a text file and spits out
%a char vector containing the variable that was 
% inside that file
%Ex : var=123ABC  --> spits out 123ABC
function [T] = extractText(text)
    
    fileID = fopen(text);
    cellText = textscan(fileID,"%c");
    fclose(fileID);
    temp = char(cellText{1,1});
    %Have to ignore first 2 caracters ('T' and '=')
    T = extractAfter(transpose(temp),2);
   
end
