%[Q2_2] Fonction prenant en arguments un texte crypte, la matrice de
%transition Q, une loi de distribution initiale pi_0 et une cle d'encodage
%et renvoyant la vraisemblance (dans la langue anglaise) de ce texte crypte
%par rapport a la cle

function [ P ] = vraisemblance(T, pinit, Q, symb)

    %Convertit notre texteen tableau de caracteres minuscules
    T = char(lower(T)); 

    %On fait nos calculs en log pour ne pas avoir des erreurs dû aux
    %limitations de l'ordinateur en terme de calcul numerique
    %NB: rajout de exp(-15) partout pour eviter les problemes avec -inf
    pi0 = log(pinit + exp(-15));
    Q = log(Q + exp(-15));
    
    %Initialement
    P = pi0(strfind(symb,T(1))); 
    
    %Calcul de la vraisemblance
    for i = 2:numel(T)
        P = P +  Q(strfind(symb,T(i-1)), strfind(symb,T(i))); 
    end
    
end