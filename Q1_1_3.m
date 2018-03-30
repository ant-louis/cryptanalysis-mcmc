function [ ProbStat ] = Q1_1_3( Q , n)
%Q1_1_3 Calcul la distribution pi a l'état n, si n = 20 on est a l'état
%stationnaire.
%It is ask to find the stationnary distribution
%From the previous graph (Q2), Stationnary after about 30 step
ProbStat = [.25 .25 .25 .25];
ProbStat = ProbStat*Q^n;
end

