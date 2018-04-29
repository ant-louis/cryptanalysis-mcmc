%Q2_2

%Fonction qui calcule la vraisemblance d'un texte T avec
%une matrice de transition Q (de la langue anglaise)
%ainsi qu'une distribution de probabilité intiale d'une lettre pi0

function [ P ] = vraisemblance(T, pi0, Q, symb)
T = lower(T);
P = pi0(strfind(symb,T(1))); 
for i =2:length(T)
    temp = (pi0*Q(i-1));
    P = P*temp(strfind(symb,T(i)));
end
end

