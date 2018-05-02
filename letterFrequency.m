function [frequency] = letterFrequency(Tcrypte)
Tcrypte = char(lower(Tcrypte)); %Make sure it's a char array
symbols;
symb_len = numel(symb);
T_length = numel(Tcrypte);
frequency =zeros(40,1);

for i=1:symb_len
    nb = length(strfind(Tcrypte,symb(i)));
    frequency(i) = nb/T_length;
end
end
    
    
