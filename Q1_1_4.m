function [ SimuSeq ] = Q1_1_4( Q, piStat,  T )
%Q1_1_4 Cr�� une chaine du m�me type que celle dict�e par "seq1", pi0 est
%la distribution stationnaire.
%Ask to simulate a realisation of the random sequence
%La premi�re lettre est choisie al�atoirement selon la distribution
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
%On peut v�rifi� que le nombre de 'd' ou 'c' de la chaine cr�� est proche
%de ce que l'on trouve dans la chaine donn�e

%On reconverti les nombres en letter
res = char(zeros(size(SimuSeq)));
res(SimuSeq==1) = 'a'; 
res(SimuSeq==2) = 'b'; 
res(SimuSeq==3) = 'c'; 
res(SimuSeq==4) = 'd';
SimuSeq = res;
%------------Comparaison sur les probabilit�s--------------------
PSimu = [sum(SimuSeq == 'a') sum(SimuSeq == 'b') sum(SimuSeq == 'c') sum(SimuSeq == 'd')];
PSimu = PSimu./length(SimuSeq);
disp(PSimu);
%----------------------------------------------------------------
end

