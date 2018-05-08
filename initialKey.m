%Fonction prenant en arguments le texte crypte, la matrice de
%transition Q de la langue anglaise et la distribution initiale, calcule
%les probabilites stationnaires de la langue anglaise et du texte crypte,
%les compare et fais une premiere approximation de la cle d'encodage en
%fonction des probabilites similaires.

function [ key ] = initialKey(Tcrypte,pinit,Q)

    symbols;
    key = char(symb);

    %Calcul des probabilites stationnaires
    ProbStatEnglish = englishFrequency(pinit,Q);
    ProbStatCrypte = letterFrequency(Tcrypte);

    for i=1:length(symb)
        
        %Frequence du symbole i
        freq = ProbStatEnglish(i);
        
        %Indice de la lettre dont la frequence d'apparition se rapproche
        %le plus de celle d'une autre lettre dans la langue anglaise
        closestFreq = abs(ProbStatCrypte - freq);
        index = find(closestFreq == min(closestFreq),1);

        %Echanger les deux lettres et les deux probas
        key([i index]) = key([index i]);
        ProbStatCrypte([i index]) = ProbStatCrypte([index i]);

    end
end

