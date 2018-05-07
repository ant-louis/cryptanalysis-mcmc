function [yfirst] = propDist(Tcrypte,pinit,Q)
symbols;

yfirst = zeros(1,40);

PiStat = englishFrequency(pinit,Q);
PiCrypte = letterFrequency(Tcrypte);
for i=1:40
    
freq = PiStat(i); %Frequence de la lettre i
%Indice de la lettre se rapprochant le plus de la frequence d'une autre
%lettre dans la langue anglaise
closestFreq = abs(PiCrypte - freq);
index = find(closestFreq == min(closestFreq),1);

%Echanger les deux lettres
yfirst(i) = symb(index);
PiCrypte(index)=[]; %Remove matching frequency
symb(index)=[]; %Remove matching symbol

end
end

