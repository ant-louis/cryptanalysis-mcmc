function [ SimuSeq ] = Q1_1_4( Q, piStat,  T )
%Q1_1_4 Cree une chaine du meme type que celle dictee par "seq1", pi0 est
%la distribution stationnaire.
%La premiere lettre est choisie aleatoirement selon la distribution
%uniforme
rnd = rand;
if rnd <piStat(1)
        letter = 1;
elseif rnd < piStat(2)
        letter = 2;
elseif rnd < piStat(3)
        letter = 3;
else
        letter = 4;
end

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
%On peut verifie que le nombre de 'd' ou 'c' de la chaine cree est proche
%de ce que l'on trouve dans la chaine donnee

%On reconverti les nombres en letter
res = char(zeros(size(SimuSeq)));
res(SimuSeq==1) = 'a'; 
res(SimuSeq==2) = 'b'; 
res(SimuSeq==3) = 'c'; 
res(SimuSeq==4) = 'd';
SimuSeq = res;
%------------Comparaison sur les probabilites--------------------
PSimu = [sum(SimuSeq == 'a') sum(SimuSeq == 'b') sum(SimuSeq == 'c') sum(SimuSeq == 'd')];
PSimu = PSimu./length(SimuSeq);
disp(PSimu);
%----------------------------------------------------------------
end

