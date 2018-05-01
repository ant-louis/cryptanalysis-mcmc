%Fonction qui decrypte un texte Tcrypte avec un code de chiffrement y

function [T_chap] = decrypt(Tcrypte,y)
symbols;
Tcrypte = char(Tcrypte); %Make sure it's a char array
T_chap = '';
for i=1: strlength(Tcrypte)
    %Trouver Tcrypte(i) dans y
    index = strfind(y,Tcrypte(i))
    %Prendre index
    %Placer dans T_chap l'index de symb venu de y
    T_chap = strcat(T_chap,symb(index));

end
end

