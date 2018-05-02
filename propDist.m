function [y,PiCry] = propDist( PiInf, PiCry, y )
%PROPDIST Summary of this function goes here
indice1 = randi([1 40]); %Index aleatoire
freq = PiInf(indice1); %Frequence de la lettre choisie aleatoirement

%Indice de la lettre se rapprochant le plus de la frequence d'une autre
%lettre dans la langue anglaise
PiCry_temp = abs(PiCry - freq);
indice2 = find(PiCry_temp == min(PiCry_temp),1);

%Echanger les deux lettres
y_temp = y(indice1);
y(indice1) = y(indice2);
y(indice2) = y_temp;

%Echanger les deux frequences
PiCry_temp = PiInf(indice1);
PiCry(indice1) = PiCry(indice2);
PiCry(indice2) = PiCry_temp;

end

