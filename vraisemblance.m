%Q2_2

%Fonction qui calcule la vraisemblance d'un texte T avec
%une matrice de transition Q (de la langue anglaise)
%ainsi qu'une distribution de probabilité intiale d'une lettre pi0

function [ P ] = vraisemblance(T, pi0, Q, symb)
T = char(lower(T)); %convert to char array

%Probabilité d'avoir la lettre T(1) comme première lettre
P = log(pi0(strfind(symb,T(1)))); % initialement

for i = 2:numel(T)
    P = P + log(Q(strfind(symb,T(i-1)),strfind(symb,T(i)))); % on extrait la probabilit� 
end
end

