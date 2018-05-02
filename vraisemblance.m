%Q2_2

%Fonction qui calcule la vraisemblance d'un texte T avec
%une matrice de transition Q (de la langue anglaise)
%ainsi qu'une distribution de probabilité intiale d'une lettre pi0


function [ P ] = vraisemblance(T, pi0, Q, symb)
T = char(lower(T)); %convert to char array

%On fait  + 1 partout pour ne pas avoir de problèmes avec de 0
pi0 = pi0 + 1;
Q = Q + 1 ;

%On fait nos calculs en log pour ne pas avoir des erreurs dû aux
%limitations de l'ordinateur en terme de calcul numérique

P = log(pi0(strfind(symb,T(1)))); % Initialement
for i = 2:numel(T)
    P = P + log(Q(strfind(symb,T(i-1)),strfind(symb,T(i)))); 

end
end

