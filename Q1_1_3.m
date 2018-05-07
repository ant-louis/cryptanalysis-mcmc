%[Q1_1_3] Calcul la distribution pi a l'etat n 
%Rem: Si n = 20 on est a l'etat stationnaire.

function [ ProbStat ] = Q1_1_3( Q , n )

    ProbStat = [.25 .25 .25 .25];
    ProbStat = ProbStat*Q^n;
    
end

