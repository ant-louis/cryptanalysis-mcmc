function [ nbLet ] = CorrectLetter( Ch1, Ch2 )
%CORRECTLETTER output the number of symb taht are the same in Ch1 and Ch2
%for same index, Ch1 and Ch2 shoould be the same length
tmp = zeros(1,length(Ch1));
for i=1:length(Ch1)
    tmp(i) = (Ch1(i) == Ch2(i));
end
nbLet = sum(tmp);
end

