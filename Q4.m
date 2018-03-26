%Ask to simulate a realisation of the random sequence
T = 200;% length of the sequence
letter = rand([0 4]);
SimuSeq = zeros(1,T);
for k = 1:T
    rnd = rand;
    if rnd < Q(letter,1)
        letter = 1;
    elseif rnd < Q(letter,1)+Q(letter,2)
        letter = 2;
    elseif rnd < Q(letter,1)+Q(letter,2)+Q(letter,3)
        letter = 3;
    else
        letter = 4;
    end
    SimuSeq(k) = letter;
end
% It works and can be verified as sum(SimuSeq == 4) is praticaly equal to
% sum(seq == 'd')
clear T k rnd letter