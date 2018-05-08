%Fonction prenant en argument le texte crypte renvoyant la frequence
%d'apparition de chaque symbole dans ce texte

function [frequency] = letterFrequency(Tcrypte)

    symbols;%load symb
    Tcrypte = char(lower(Tcrypte));
    
    T_length = length(Tcrypte);
    
    frequency = zeros(1,length(symb));

    for i=1:length(symb)
        nb = length(strfind(Tcrypte,symb(i)));
        frequency(i) = nb/T_length;
    end
end
    
    
