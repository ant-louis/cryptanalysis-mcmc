function [ P ] = Q2_2( T, pi0, Q , symb)
%T est le texte dont on doit calculer la vraisemblance
% symb est la liste des symboles
P = pi0(strfind(symb,T(1)));
for i =2:length(T)
    temp = (pi0*Q(i-1));
    P = P*temp(strfind(symb,T(i)));
end
end

