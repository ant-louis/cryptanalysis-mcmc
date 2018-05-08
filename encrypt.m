%Fonction prenant en arguments un texte et une cle de cryptage et
%renvoyant le texte crypte selon cette cle.

function [ Tcrypte ] = encrypt( T, key )

    symbols;
    T = char(lower(T));
    Tcrypte = '';
    
    for i=1: numel(T)
        index = strfind(symb,T(i));
        Tcrypte = [Tcrypte key(index)];
    end
    
end
