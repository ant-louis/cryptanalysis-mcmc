% This method outputs the symbols and the total amount of symbols
%symbols that are at the same index in Ch1 and Ch2
% Ch1 and Ch2 have to be the same length
function [ nbLet, letters ] = CorrectLetter( Ch1, Ch2 )

    letters = '';
    nbLet = 0;

    for i=1:length(Ch1)
        if (Ch1(i) == Ch2(i))
            nbLet = nbLet + 1;
            letters = [letters Ch1(i)];
        end
    end
    
end

