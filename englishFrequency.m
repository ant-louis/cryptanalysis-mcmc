%Fonction prenant en arguments la distribution initiale pi_0 et la matrice
%de transition Q et renvoyant la distribution stationnaire pi_inf de la
%langue anglaise en general.

function [ PiInf ] = englishFrequency( pinit, Q )

    PiInf = pinit*Q^20;
    PiInf = transpose(PiInf);
    
end
