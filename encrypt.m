%Fonction qui encrypte un texte T avec un code de chiffrement y

function [Tcrypte] = encrypt(T,y)
symbols;
T = char(lower(T)); %Make sure it's a char array
Tcrypte = '';
for i=1: strlength(T)
    index = strfind(symb,T(i));
    Tcrypte = [Tcrypte y(index)];
end
end
