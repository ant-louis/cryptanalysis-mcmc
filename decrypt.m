%Fonction qui decrypte un texte Tcrypte avec un code de chiffrement y

function [T_chap] = decrypt(Tcrypte,y)
symbols;
Tcrypte = char(lower(Tcrypte)); %Make sure it's a char array
T_chap = '';
for i=1: strlength(Tcrypte)
    index = strfind(y,Tcrypte(i));
    T_chap = [T_chap symb(index)];
end
end

