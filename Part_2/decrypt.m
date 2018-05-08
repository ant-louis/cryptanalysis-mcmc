%Fonction prenant en arguments un texte crypte et une cle de decryptage
%renvoyant le texte decrypte selon cette cle.

function [ Tdecrypt ] = decrypt( Tcrypte, key )

    symbols;
    Tcrypte = char(lower(Tcrypte));
    Tdecrypt = '';

    for i=1: numel(Tcrypte)
        index = strfind(key,Tcrypte(i));
        Tdecrypt = [Tdecrypt symb(index)];
    end
    
end

