%Q2_2

%Fonction qui calcule la vraisemblance d'un texte T avec
%une matrice de transition Q (de la langue anglaise)
%ainsi qu'une distribution de probabilité intiale d'une lettre pi0


function [ P ] = vraisemblance(T, pinit, Q, symb)
T = char(lower(T)); %convert to char array

%On fait  + 10e-12 partout pour ne pas avoir de problèmes avec de 0
pinit = log(pinit + 10e-12);
Q = log(Q + 10e-12);

%On fait nos calculs en log pour ne pas avoir des erreurs dû aux
%limitations de l'ordinateur en terme de calcul numérique

P = pinit(strfind(symb,T(1))); % Initialement
for i = 2:numel(T)
    P = P + Q(strfind(symb,T(i-1)),strfind(symb,T(i))); 
end
end

