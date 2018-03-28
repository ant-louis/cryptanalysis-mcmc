%Ask to simulate a realisation of the random sequence
T = 200;% length of the sequence
letter = rand([0 4]);%La première lettre est choisie aléatoirement
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
%On peut vérifié que le nombre de 'd' ou 'c' de la chaine créé est proche
%de ce que l'on trouve dans la chaine donnée

%On reconverti les nombres en letter
res = char(zeros(size(SimuSeq)));
res(SimuSeq==1) = 'a'; 
res(SimuSeq==2) = 'b'; 
res(SimuSeq==3) = 'c'; 
res(SimuSeq==4) = 'd';
SimuSeq = res;
clear T k rnd letter res