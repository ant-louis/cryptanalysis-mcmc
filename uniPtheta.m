function [ tetha ] = uniPtheta( symb )
N = length(symb);
for i=1: length(symb)
    random = randi([1 N]);
    tetha(i) = symb(random);
    symb(random) = [];
    N = N-1;
end
end

